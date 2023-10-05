package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.repository.model.Booking;
import com.silver.hallofart.repository.model.ShowTime;

@Mapper
public interface BookingRepository {
	
	public List<ShowTime> findShowTimeListByShowId(Integer showId);
	public List<SeatStatusDto> findSeatListByShowTimeId(Integer showTimeId);
	public String findHallNameByShowId(Integer showId);
	public void insertBookingInfo(Booking booking);
	public Booking findBookingByshowTimeIdAndseatId(@Param("showTimeId")Integer showTimeId, 
			@Param("seatId")Integer seatId);
}
