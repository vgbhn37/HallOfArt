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

	// 결제
	@PostMapping("/payment/payment_proc")
	public String paymentProc(@RequestBody PaymentDto paymentDto) {

		System.out.println(paymentDto.getImpUid());
		System.out.println(paymentDto.getMerchantUid());
		for (Integer id : paymentDto.getPaidSeats()) {
			System.out.println(id);
		}
		System.out.println(paymentDto.getPrice());
		// paymentDto의 값이 제대로 들어오지 않았을 경우 fail
		if(paymentDto==null || paymentDto.getImpUid().isEmpty() || paymentDto.getMerchantUid().isEmpty()||
				paymentDto.getPaidSeats().size()==0 || paymentDto.getPrice()==null) {
			return "fail";
		}
		//DB에 등록된 좌석 값의 총 합과 결제요청에서 들어온 값이 다를 경우 fail		
		bookingService.updateBookingToSuccess(paymentDto.getPaidSeats());
		return "success";
	}
	
	@PutMapping("/payment/refund_proc")
	public String refundProc(@RequestBody Integer id) {
		
		
		return "success";
	}
	
}
