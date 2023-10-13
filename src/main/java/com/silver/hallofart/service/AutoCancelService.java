package com.silver.hallofart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.silver.hallofart.repository.interfaces.BookingRepository;

@Service
public class AutoCancelService {

	@Autowired
	BookingRepository bookingRepository;
	
	//매 분 0초마다 30분 이상 결제대기 상태인 예약을 찾아서 삭제
	@Scheduled(cron ="0 * * * * *")
	public void deleteNonpaidBooking() {
		
		int result = bookingRepository.deleteNonpaymentBooking();
		if(result!=0) {
			System.out.println(result + "건의 예매가 취소 : non_paid");
		}
	}
}
