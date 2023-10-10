package com.silver.hallofart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.BookedSeatDto;
import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.dto.SelectedSeatDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.repository.interfaces.BookingRepository;
import com.silver.hallofart.repository.model.Booking;
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
	
	@Transactional
	public void insertBookingInfo(List<SelectedSeatDto> selectedSeatList, int userId) {
		
		for (SelectedSeatDto selectedSeatDto : selectedSeatList) {
			
			// 해당 좌석이 이미 예매 됐을 경우 throw
			if(bookingRepository.findBookingByshowTimeIdAndseatId
					(selectedSeatDto.getShowTimeId(), selectedSeatDto.getSeatId())!=null) {
				System.out.println("오류발생");
				throw new CustomRestfulException("이미 예매된 좌석입니다.", HttpStatus.BAD_REQUEST);
			}
			Booking booking = new Booking();
			booking.setSeatTbId(selectedSeatDto.getSeatId());
			booking.setShowTbId(selectedSeatDto.getShowId());
			booking.setShowTimeTbId(selectedSeatDto.getShowTimeId());
			booking.setUserTbId(userId);
			booking.setStatus("결제 대기");
			
			bookingRepository.insertBookingInfo(booking);
		}
	}
	
	public List<BookedSeatDto> findpaymentListByUserId(int id){
		List<BookedSeatDto> findpaymentListByUserId = new ArrayList<>();
		List<Booking> bookingList = bookingRepository.findWaitingPaymentBookingByUserId(id);
		for (Booking booking : bookingList) {
			BookedSeatDto dto = new BookedSeatDto();
			dto.setBookingId(booking.getId());
			dto.setTitle(bookingRepository.findShowTitleByShowId(booking.getShowTbId()));
			dto.setHallName(bookingRepository.findHallNameByShowId(booking.getShowTbId()));
			dto.setSeatName(bookingRepository.findSeatNameBySeatId(booking.getSeatTbId()));
			dto.setPrice(bookingRepository.findPriceByShowId(booking.getShowTbId()));
			dto.setStartTime(bookingRepository.findShowTimeByShowTimeId(booking.getShowTimeTbId()));
			findpaymentListByUserId.add(dto);
		}
		
		return findpaymentListByUserId;
	}
	
	public void updateBookingToSuccess(List<Integer> seatIds) {
		for (Integer id : seatIds) {
			bookingRepository.updateBookingToRefund(id);
		}
	}
	
	public void updateBookingToRefund(Integer id) {
		bookingRepository.updateBookingToRefund(id);
	}
	
	public int deleteBookingById(Integer id) {	
		return bookingRepository.deleteBookingById(id);
	}
}
