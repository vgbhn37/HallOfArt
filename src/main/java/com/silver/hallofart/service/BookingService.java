package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.repository.interfaces.BookingRepository;
import com.silver.hallofart.repository.model.Seat;
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
	
	public List<SeatStatusDto> findSeatListByShowTimeId(Integer showTimeId){
		
		List<SeatStatusDto> seatList = bookingRepository.findSeatListByShowTimeId(showTimeId);
		if(seatList == null) {
			System.out.println("-- 좌석 못가져옴-- ");
		}
			return seatList;
	}
	
	public String findHallNameByShowId(Integer showId) {
		return bookingRepository.findHallNameByShowId(showId);
	}
	
}
