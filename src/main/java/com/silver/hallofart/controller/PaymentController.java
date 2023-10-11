package com.silver.hallofart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.service.BookingService;

@RestController
public class PaymentController {
	
	@Autowired
	BookingService bookingService;


	
}
