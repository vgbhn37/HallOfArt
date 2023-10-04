package com.silver.hallofart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.repository.model.Show;
import com.silver.hallofart.repository.model.ShowTime;
import com.silver.hallofart.service.BookingService;
import com.silver.hallofart.service.ShowService;

@Controller
public class BookingController {
	
	@Autowired
	BookingService bookingService;

//	@GetMapping("/booking/booking/{showId}")
//	public String book(@PathVariable Integer showId ,Model model) {
//		
//		List<ShowTime> showTimeList = bookingService.findShowTime(showId);
//		model.addAttribute("showTimeList", showTimeList);
//		
//		return "/booking/booking";
//	}
	
	@Autowired
	ShowService showService;
	
	
	//해당 show의 좌석예매 페이지로 진입
	@GetMapping("/booking/booking/{showId}")
	public String book(@PathVariable Integer showId ,Model model) {
		
		//인증 및 유효성검사 체크 필요
		
		Show show = showService.showById(showId);
		List<ShowTime> showTimeList = bookingService.findShowTime(showId);
		String hallName = bookingService.findHallNameByShowId(showId);
		model.addAttribute("show",show);
		model.addAttribute("showTimeList", showTimeList);
		model.addAttribute("hallName",hallName);
		return "/booking/booking";
	}
	
	//해당 showtime의 좌석리스트
	@PostMapping("/booking/select-time/{showTimeId}")
	@ResponseBody
	public List<SeatStatusDto> seatList(@PathVariable Integer showTimeId){
		
		// 인증 및 유효성 검사 체크 필요
		List<SeatStatusDto> seatList = bookingService.findSeatListByShowTimeId(showTimeId);
		return seatList;
	}
	
	
	
}
