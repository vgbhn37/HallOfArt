package com.silver.hallofart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.silver.hallofart.repository.model.ShowTime;
import com.silver.hallofart.service.BookingService;

@Controller
public class BookingController {
	
	@Autowired
	BookingService bookingService;

	@GetMapping("/booking/booking/{showId}")
	public String book(@PathVariable Integer showId ,Model model) {
		
		List<ShowTime> showTimeList = bookingService.findShowTime(showId);
		model.addAttribute("showTimeList", showTimeList);
		
		return "/booking/booking";
	}
	

}
