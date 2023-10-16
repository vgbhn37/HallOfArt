package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.repository.model.Show;

@Mapper
public interface PaymentRepository {
	//select
	public String findPaymentTidByBookingId(Integer id);
	public String findPaymentTidByShowId(Integer id);
	public Integer findPriceByPaymentTid(String tid);
	
	
	// 추후 showRepository로 옮겨야함
	public List<Show> findShowListOnMain();
	
	//insert
	public int insertPaymentInfo(PaymentDto paymentDto);
	
	//update
	public int updatePaymentTidToBooking(@Param("tid")String tid, @Param("id")Integer id);
	public int updatePaymentTidToRental(@Param("tid")String tid, @Param("id")Integer id);
	public int updateRefundedAmount(@Param("tid")String tid, @Param("amount")int amount);
	
	//delete
	public void deletePaymentByTid(String tid);
}
