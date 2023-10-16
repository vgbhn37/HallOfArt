package com.silver.hallofart.repository.interfaces;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.repository.model.Booking;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.ShowTime;

@Mapper
public interface BookingRepository {
	
	//select
	public List<ShowTime> findShowTimeListByShowId(Integer showId);
	public List<SeatStatusDto> findSeatListByShowTimeIdAndHallId(@Param("showTimeId") Integer showTimeId, @Param("hallId") Integer hallId);
	public String findHallNameByShowId(Integer showId);
	public Hall findHallByShowId(Integer showId);
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
	public String findShowImgByshowId(Integer id);
	public Integer findRentalAmountByShowId(Integer showTbId);
	public List<Rental> findRentalByUserId(Integer userTbId);
	public String findStatusByShowId(Integer id);
	public Timestamp findStartDateByShowId(Integer id);
	public Timestamp findEndDateByShowId(Integer id);
	
	//insert
	public void insertBookingInfo(Booking booking);
	
	//update
	public int updateBookingToSuccess(Integer id);
	public int updateRentalToSuccess(Integer id);
	public int updateBookingToRefund(Integer id);
	public int updateRentalToRefund(Integer id);

	
	//delete
	public int deleteBookingById(Integer id);
	public int deleteNonpaymentBooking();
	
}
