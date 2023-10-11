package com.silver.hallofart.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.PaymentDto;

@Mapper
public interface PaymentRepository {
	//select
	public String findPaymentTidByBookingId(Integer id);
	
	//insert
	public int insertPaymentInfo(PaymentDto paymentDto);
	
	//update
	public int updatePaymentTidToBooking(@Param("tid")String tid, @Param("id")Integer id);
	public int updateRefundedAmount(@Param("tid")String tid, @Param("amount")int amount);
	
	//delete
	public void deletePaymentByTid(String tid);
}
