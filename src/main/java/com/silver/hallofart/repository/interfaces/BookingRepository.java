package com.silver.hallofart.repository.interfaces;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.repository.model.Booking;
import com.silver.hallofart.repository.model.ShowTime;

@Mapper
public interface BookingRepository {
	
	//select
	public List<ShowTime> findShowTimeListByShowId(Integer showId);
	public List<SeatStatusDto> findSeatListByShowTimeId(Integer showTimeId);
	public String findHallNameByShowId(Integer showId);
	public Booking findBookingByshowTimeIdAndseatId(@Param("showTimeId")Integer showTimeId, 
			@Param("seatId")Integer seatId);
	public List<Booking> findWaitingPaymentBookingByUserId(int id);
	public List<Booking> findSuccessPaymentBookingByUserId(int id);
	public String findSeatNameBySeatId(Integer id);
	public Timestamp findShowTimeByShowTimeId(Integer id);
	public Timestamp findShowTimeByBookingId(Integer id);
	public String findShowTitleByShowId(Integer id);
	public Integer findPriceByShowId(Integer id);
	public Integer findPriceByBookingId(Integer id);
	public String findShowTitleByBookingId(Integer id);
	public String findSeatNameByBookingId(Integer id);
	
	//insert
	public void insertBookingInfo(Booking booking);
	
	//update
	public int updateBookingToSuccess(Integer id);
	public int updateBookingToRefund(Integer id);
	
	//delete
	public int deleteBookingById(Integer id);
	
}
