package com.silver.hallofart.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.silver.hallofart.dto.BookedSeatDto;
import com.silver.hallofart.dto.BookingExhibitionDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.dto.RentalInfoDto;
import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.dto.SelectedSeatDto;
import com.silver.hallofart.dto.ShowDetailDto;
import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.handler.exception.BadRequestException;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.handler.exception.ForbiddenException;
import com.silver.hallofart.handler.exception.UnAuthorizedException;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.ShowTime;
import com.silver.hallofart.service.BookingService;
import com.silver.hallofart.service.ShowService;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;

	@Autowired
	ShowService showService;

	@Autowired
	HttpSession session;

	// 해당 show의 좌석예매 페이지로 진입
	@GetMapping("/booking/booking/{showId}")
	public String book(@PathVariable Integer showId, Model model, HttpServletRequest request) {

		// 인증 및 유효성검사 체크 필요
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}

		ShowDetailDto show = showService.showById(showId);
		List<ShowTime> showTimeList = bookingService.findShowTime(showId);
		Hall hall = bookingService.findHallByShowId(showId);
		model.addAttribute("show", show);
		model.addAttribute("showTimeList", showTimeList);
		model.addAttribute("hall", hall);

		if (hall.getHallTypeId() == 1) {
			return "/booking/show";
		} else if (hall.getHallTypeId() == 2) {
			return "/booking/exhibition";
		}

		return "/";
	}

	// 해당 showtime의 좌석리스트
	@GetMapping("/booking/selectTime")
	@ResponseBody
	public List<SeatStatusDto> seatList(@RequestParam("showTimeId") Integer showTimeId,
			@RequestParam("hallId") Integer hallId, HttpServletRequest request) {
		// 주소창에 직접 입력시 오류 발생
		if (request.getHeader("REFERER") == null) {
			throw new BadRequestException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		// 인증 및 유효성 검사 체크 필요
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}
		List<SeatStatusDto> seatList = bookingService.findSeatListByShowTimeId(showTimeId, hallId);
		return seatList;
	}

	@GetMapping("/booking/showBookableEx")
	@ResponseBody
	public BookingExhibitionDto bookableExhibition(@RequestParam("showTimeId") Integer showTimeId,
			@RequestParam("showId") Integer showId, HttpServletRequest request) {
		// 주소창에 직접 입력시 오류 발생
		if (request.getHeader("REFERER") == null) {
			throw new BadRequestException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		// 인증 및 유효성 검사 체크 필요
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}
		
		System.out.println(showTimeId);
		System.out.println(showId);
		
		BookingExhibitionDto dto =  bookingService.findExhibitionInfo(showTimeId, showId);
		System.out.println(dto.getRemaining());
		System.out.println(dto.getMaxSeat());
		return dto;
	}

	// 예매하기 버튼을 눌렀을 때, 유효성 체크 후 성공시 success 실패시 fail 문자열을 response
	@PostMapping("/booking/book-proc")
	@ResponseBody
	public String bookingSeat(@RequestBody Map<String, List<SelectedSeatDto>> selectedSeats) {
		// 로그인 체크
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}
		// script에서 받아온 seletedSeat 리스트
		List<SelectedSeatDto> selectedSeatList = selectedSeats.get("selectedSeats");
		for (SelectedSeatDto dto : selectedSeatList) {
			System.out.println(dto.getQuantity());
			System.out.println(dto.getSeatId());
			System.out.println(dto.getShowId());
			System.out.println(dto.getShowTimeId());
		}
		
		// 리스트로 booking_tb에 데이터 삽입
		try {
			bookingService.insertBookingInfo(selectedSeatList, user.getId());
		} catch (Exception e) {
			// 오류 발생 시 fail 문자열 response (js에서 처리)
			System.out.println(e.getMessage());
			return "fail";
		}
		return "success";
	}

	// 예약 성공 알림 페이지 -> 결제 대기 리스트 페이지로 넘어감
	@GetMapping("/booking/success")
	public String bookingSuccess(HttpServletRequest request) {
		// 주소창에 직접 입력시 오류 발생
		if (request.getHeader("REFERER") == null) {
			throw new BadRequestException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		return "booking/success";
	}

	// 해당 예약 내역 삭제 (결제 전 취소건은 DB에서 삭제)
	@DeleteMapping("/booking/delete/{id}")
	@ResponseBody
	public String deleteBooking(@PathVariable Integer id) {

		// 사용자 인증 처리
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}

		if (bookingService.deleteBookingById(id) != 1) {
			return "fail";
		}

		return "success";
	}

	// 결제 대기 리스트
	@GetMapping("/user/payList/{id}")
	public String payList(@PathVariable int id, Model model) {

		// 사용자 인증 처리
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}
		if (user.getId() != id) {
			throw new ForbiddenException("잘못된 접근입니다.", HttpStatus.FORBIDDEN);
		}

		// 결제 대기 상태인 예약테이블 리스트를 가져와서 뿌림
		List<BookedSeatDto> payList = bookingService.findpaymentListByUserId(id);
		model.addAttribute("payList", payList);

		return "/user/payList";
	}

	// 결제가 완료 된 티켓리스트
	@GetMapping("/user/ticketList/{id}")
	public String ticketList(@PathVariable int id, Model model) {

		// 사용자 인증 처리
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}
		if (user.getId() != id) {
			throw new ForbiddenException("잘못된 접근입니다.", HttpStatus.FORBIDDEN);
		}

		// 결제 완료 된 티켓리스트를 가져와서 뿌림
		List<BookedSeatDto> ticketList = bookingService.findTicketByUserId(id);
		model.addAttribute("ticketList", ticketList);

		// (시작 시간 - 24시간)과 현재 시간을 비교해 환불 버튼을 숨기기 위해 요청 시 현재시간
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		model.addAttribute("currentTime", currentTimestamp);

		return "/user/ticketList";
	}

	// 대관 신청 리스트
	@GetMapping("/user/rentalList/{id}")
	public String rentalList(@PathVariable int id, Model model) {

		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}
		if (user.getId() != id) {
			throw new ForbiddenException("잘못된 접근입니다.", HttpStatus.FORBIDDEN);
		}

		// 해당 로그인 된 아이디의 대관 신청 리스트
		List<RentalInfoDto> rentalList = bookingService.findRentalList(id);
		model.addAttribute("rentalList", rentalList);
		return "/user/rentalList";

	}

}
