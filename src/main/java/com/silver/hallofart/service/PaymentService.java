package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.repository.interfaces.BookingRepository;
import com.silver.hallofart.repository.interfaces.PaymentRepository;

@Service
public class PaymentService {

	@Autowired
	PaymentRepository paymentRepository;
	
	@Autowired
	BookingRepository bookingRepository;
	
	@Transactional
	public void insertPaymentInfo(String tid, String orderNumber, int amount, List<Integer> ids) {
		
		PaymentDto paymentDto = new PaymentDto();
		paymentDto.setTid(tid);
		paymentDto.setOrderNumber(orderNumber);
		paymentDto.setAmount(amount);
		
		int result = paymentRepository.insertPaymentInfo(paymentDto);
		if(result!=1) {
			throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}
		for (Integer integer : ids) {
			int result2 = paymentRepository.updatePaymentTidToBooking(tid,integer);
			if(result2!=1) {
				throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
			}
			int result3 = bookingRepository.updateBookingToSuccess(integer);
			if(result3!=1) {
				throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
			}
		}
		
	}
	
}
