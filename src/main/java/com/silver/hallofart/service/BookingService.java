package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.repository.interfaces.BookingRepository;
import com.silver.hallofart.repository.model.ShowTime;

@Service
public class BookingService {
	
	@Autowired
	private BookingRepository bookingRepository;	
	
	public List<ShowTime> findShowTime(Integer showId) {
		
		List<ShowTime> showTimeList = bookingRepository.findShowTimeListByShowId(showId);
		if(showTimeList==null) {
			System.out.println("-- 못 가져옴 --");
		}
			return showTimeList;
		
	}
	
}
