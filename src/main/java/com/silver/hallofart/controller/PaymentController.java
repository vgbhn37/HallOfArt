package com.silver.hallofart.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.silver.hallofart.dto.KakaoPayRefundDto;
import com.silver.hallofart.dto.KakaoPayResponseDto;
import com.silver.hallofart.dto.KakaoPaySuccessDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.dto.PaymentRequestDto;
import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.handler.exception.UnAuthorizedException;
import com.silver.hallofart.service.BookingService;
import com.silver.hallofart.service.PaymentService;

@Controller
public class PaymentController {

	@Value("${kakao_payment_api_key}")
	private String kakaoApiKey;

	@Autowired
	BookingService bookingService;

	@Autowired
	PaymentService paymentService;

	@Autowired
	HttpSession session;

	// 일반 결제 전역변수
	private String tid;
	private String orderNum;
	private List<Integer> bookIds;

	// 대관 결제 전역변수
	private String rentalTid;
	private String rentalOrderNum;
	private Integer showTbId;

	// 일반 티켓 결제
	@PostMapping("/payment/request")
	@ResponseBody
	public String paymentRequest(@RequestBody PaymentRequestDto payreqDto) {
		// 로그인 된 유저
		UserDto user = (UserDto) session.getAttribute("user");
		// 결제 요청 좌석 리스트
		bookIds = payreqDto.getSelectedSeats();

		// RestTeamplate
		RestTemplate rt = new RestTemplate();
		// 헤더 객체
		HttpHeaders headers = new HttpHeaders();
		// 카카오 결제 서버에 전달할 itemname 정하기 (좌석이 1건이면 공연+좌석이름, 2건 이상이면 첫번째 공연+좌석 외 n건)
		String firstShowName = bookingService.findShowTitleByBookingId(bookIds.get(0));
		String firstSeatName = bookingService.findSeatNameByBookingId(bookIds.get(0));
		String itemName = "";
		if (firstSeatName == null || firstSeatName.isEmpty()) {
			itemName = bookIds.size() == 1 ? firstShowName : firstShowName + " 외 " + (bookIds.size() - 1) + " 건";
		} else {
			itemName = bookIds.size() == 1 ? firstShowName + " " + firstSeatName
					: firstShowName + " " + firstSeatName + " 외 " + (bookIds.size() - 1) + " 건";
		}
		String pattern = "yyyyMMdd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		// 가맹점 주문번호 제작
		orderNum = "ODN" + date + bookIds.get(0);

		// 총 결제 금액을 DB에서 각 좌석가격을 가져와서 계산
		int amount = bookingService.totalPrice(bookIds);

		// 헤더에 들어갈 내용 싣기
		headers.add("Authorization", kakaoApiKey);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 바디에 들어갈 내용 싣기
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME"); // CID (테스트용)
		params.add("partner_order_id", orderNum); // 가맹점 주문번호
		params.add("partner_user_id", user.getUsername()); // 사용자id
		params.add("item_name", itemName); // 주문품목명
		params.add("quantity", 1); // 수량
		params.add("total_amount", amount); // 총 금액
		params.add("tax_free_amount", 0); // 비과세금액
		params.add("approval_url", "http://localhost/payment/success"); // 성공 시 리디렉션 url
		params.add("cancel_url", "http://localhost/payment/cancel");// 취소 시 리디렉션 url
		params.add("fail_url", "http://localhost/payment/fail");// 실패 시 리디렉션 url

		// 헤더와 바디를 포함하는 HTTP 객체
		HttpEntity<MultiValueMap<String, Object>> reqMes = new HttpEntity<>(params, headers);

		// http요청에 대한 응답
		ResponseEntity<KakaoPayResponseDto> response = rt.exchange("https://kapi.kakao.com/v1/payment/ready",
				HttpMethod.POST, reqMes, KakaoPayResponseDto.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			tid = response.getBody().getTid();
			return response.getBody().getNextRedirectPcUrl();
		} else {
			return "http://localhost/error/404";
		}

	}

	// 일반 결제 요청 성공 시
	@GetMapping("/payment/success")
	public String paymentSuccess(@RequestParam(name = "pg_token", required = false) String pgToken) {
		// 로그인 된 유저
		UserDto user = (UserDto) session.getAttribute("user");
		// RestTeamplate
		RestTemplate rt = new RestTemplate();
		// 헤더 객체
		HttpHeaders headers = new HttpHeaders();

		// 헤더에 들어갈 내용 싣기
		headers.add("Authorization", kakaoApiKey);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 바디에 들어갈 내용 싣기
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME"); // CID (테스트용)
		params.add("tid", tid);
		params.add("partner_order_id", orderNum);
		params.add("partner_user_id", user.getUsername());
		params.add("pg_token", pgToken);

		// 헤더와 바디를 포함하는 HTTP 객체
		HttpEntity<MultiValueMap<String, Object>> reqMes = new HttpEntity<>(params, headers);

		// http요청에 대한 응답
		ResponseEntity<KakaoPaySuccessDto> response = rt.exchange("https://kapi.kakao.com/v1/payment/approve",
				HttpMethod.POST, reqMes, KakaoPaySuccessDto.class);

		// 성공 시 결제 정보를 담고 success 페이지로
		if (response.getStatusCode() == HttpStatus.OK) {
			paymentService.insertPaymentInfo(tid, orderNum, response.getBody().getAmount().getTotal(), bookIds);

			// 전역변수 리셋
			tid = "";
			orderNum = "";
			bookIds.clear();
			return "/payment/success";
		} else {
			return "/payment/fail";
		}

	}

	// 일반 티켓 환불 요청
	@GetMapping("/payment/refund/{bookId}")
	public String paymentRefund(@PathVariable Integer bookId, HttpServletRequest request) {

		// 로그인 여부
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}

		// 주소창에 직접 입력시 오류 발생
		if (request.getHeader("REFERER") == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}

		// 요청한 시간과 시작 시간을 비교해서 시작 시간 24시간 전보다 늦은 경우 환불 불가
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		Timestamp showStartTime = bookingService.findShowTimeByBookingId(bookId);
		long twentyFourHoursAgo = showStartTime.getTime() - 86400000;
		Timestamp timestampToCompare = new Timestamp(twentyFourHoursAgo);

		if (currentTime.after(timestampToCompare)) {
			return "/payment/timeout";
		}

		// RestTeamplate
		RestTemplate rt = new RestTemplate();
		// 헤더 객체
		HttpHeaders headers = new HttpHeaders();

		// 헤더에 담길 내용
		headers.add("Authorization", kakaoApiKey);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 바디에 들어갈 내용 싣기
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", paymentService.findPaymentTidByBookingId(bookId));
		params.add("cancel_amount", bookingService.findPriceByBookingId(bookId));
		params.add("cancel_tax_free_amount", 0);

		// 헤더와 바디를 포함하는 HTTP 객체
		HttpEntity<MultiValueMap<String, Object>> reqMes = new HttpEntity<>(params, headers);

		// http요청에 대한 응답
		ResponseEntity<KakaoPayRefundDto> response = rt.exchange("https://kapi.kakao.com/v1/payment/cancel",
				HttpMethod.POST, reqMes, KakaoPayRefundDto.class);

		if (response.getStatusCode() == HttpStatus.OK) {

			paymentService.refundPayment(paymentService.findPaymentTidByBookingId(bookId),
					response.getBody().getApprovedCancelAmount().getTotal(), bookId);
			return "/payment/refundSuccess";
		} else {
			return "/payment/refundFail";
		}

	}

	// 대관 결제
	@GetMapping("/payment/request/{showTbId}")
	@ResponseBody
	public String rentalPaymentRequest(@PathVariable Integer showTbId) {
		// 로그인 된 유저
		UserDto user = (UserDto) session.getAttribute("user");

		// showTbId 저장
		this.showTbId = showTbId;
		// RestTeamplate
		RestTemplate rt = new RestTemplate();
		// 헤더 객체
		HttpHeaders headers = new HttpHeaders();
		// 카카오 결제 서버에 전달할 itemname 정하기 (좌석이 1건이면 공연+좌석이름, 2건 이상이면 첫번째 공연+좌석 외 n건)
		String hallName = bookingService.findHallNameByShowId(showTbId);
		String itemName = "예술의 전당 " + hallName + " 대관";
		// 가맹점 주문번호 제작
		String pattern = "yyyyMMdd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		rentalOrderNum = "ORNRT_" + date + showTbId;

		// 금액
		int amount = bookingService.findRentalAmountByShowId(showTbId);

		// 헤더에 들어갈 내용 싣기
		headers.add("Authorization", kakaoApiKey);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 바디에 들어갈 내용 싣기
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME"); // CID (테스트용)
		params.add("partner_order_id", rentalOrderNum); // 가맹점 주문번호
		params.add("partner_user_id", user.getUsername()); // 사용자id
		params.add("item_name", itemName); // 주문품목명
		params.add("quantity", 1); // 수량
		params.add("total_amount", amount); // 총 금액
		params.add("tax_free_amount", 0); // 비과세금액
		params.add("approval_url", "http://localhost/payment/rentalSuccess"); // 성공 시 리디렉션 url
		params.add("cancel_url", "http://localhost/payment/cancel");// 취소 시 리디렉션 url
		params.add("fail_url", "http://localhost/payment/fail");// 실패 시 리디렉션 url

		// 헤더와 바디를 포함하는 HTTP 객체
		HttpEntity<MultiValueMap<String, Object>> reqMes = new HttpEntity<>(params, headers);

		// http요청에 대한 응답
		ResponseEntity<KakaoPayResponseDto> response = rt.exchange("https://kapi.kakao.com/v1/payment/ready",
				HttpMethod.POST, reqMes, KakaoPayResponseDto.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			rentalTid = response.getBody().getTid();
			return response.getBody().getNextRedirectPcUrl();
		} else {
			return "http://localhost/error/404";
		}

	}

	// 대관 결제 요청 성공 시
	@GetMapping("/payment/rentalSuccess")
	public String paymentRentalSuccess(@RequestParam(name = "pg_token", required = false) String pgToken) {
		// 로그인 된 유저
		UserDto user = (UserDto) session.getAttribute("user");
		// RestTeamplate
		RestTemplate rt = new RestTemplate();
		// 헤더 객체
		HttpHeaders headers = new HttpHeaders();

		// 헤더에 들어갈 내용 싣기
		headers.add("Authorization", kakaoApiKey);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 바디에 들어갈 내용 싣기
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME"); // CID (테스트용)
		params.add("tid", rentalTid);
		params.add("partner_order_id", rentalOrderNum);
		params.add("partner_user_id", user.getUsername());
		params.add("pg_token", pgToken);

		// 헤더와 바디를 포함하는 HTTP 객체
		HttpEntity<MultiValueMap<String, Object>> reqMes = new HttpEntity<>(params, headers);

		// http요청에 대한 응답
		ResponseEntity<KakaoPaySuccessDto> response = rt.exchange("https://kapi.kakao.com/v1/payment/approve",
				HttpMethod.POST, reqMes, KakaoPaySuccessDto.class);

		// 성공 시 결제 정보를 담고 success 페이지로
		if (response.getStatusCode() == HttpStatus.OK) {
			paymentService.insertRentalInfo(rentalTid, rentalOrderNum, response.getBody().getAmount().getTotal(),
					showTbId);

			// 전역변수 리셋
			rentalTid = "";
			rentalOrderNum = "";
			return "/payment/rentalSuccess";
		} else {
			return "/payment/fail";
		}

	}

	// 대관 환불 요청 시

	@GetMapping("/payment/rentalRefund/{showTbId}")
	public String paymentRentalRefund(@PathVariable Integer showTbId, HttpServletRequest request) {

		// 로그인 여부
		UserDto user = (UserDto) session.getAttribute("user");
		if (user == null) {
			throw new UnAuthorizedException("로그인 해주세요!", HttpStatus.UNAUTHORIZED);
		}

		// 주소창에 직접 입력시 오류 발생
		if (request.getHeader("REFERER") == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}

		// RestTeamplate
		RestTemplate rt = new RestTemplate();
		// 헤더 객체
		HttpHeaders headers = new HttpHeaders();

		String r_tid = paymentService.findPaymentTidByShowId(showTbId);

		// 헤더에 담길 내용
		headers.add("Authorization", kakaoApiKey);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 바디에 들어갈 내용 싣기
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", r_tid);
		params.add("cancel_amount", paymentService.findPriceByPaymentTid(r_tid));
		params.add("cancel_tax_free_amount", 0);

		// 헤더와 바디를 포함하는 HTTP 객체
		HttpEntity<MultiValueMap<String, Object>> reqMes = new HttpEntity<>(params, headers);

		// http요청에 대한 응답
		ResponseEntity<KakaoPayRefundDto> response = rt.exchange("https://kapi.kakao.com/v1/payment/cancel",
				HttpMethod.POST, reqMes, KakaoPayRefundDto.class);

		if (response.getStatusCode() == HttpStatus.OK) {
			paymentService.rentalRefundPayment(r_tid, response.getBody().getApprovedCancelAmount().getTotal(),
					showTbId);

			return "/payment/rentalRefundSuccess";
		} else {
			return "/payment/refundFail";
		}

	}

	@GetMapping("/payment/cancel")
	public String paymentCancel() {
		return "/payment/cancel";
	}

	@GetMapping("/payment/fail")
	public String paymentFail() {

		return "/payment/fail";
	}

	// 테스트 에러페이지
	@GetMapping("/error/404")
	public String error404() {
		return "/booking/404";
	}

}
