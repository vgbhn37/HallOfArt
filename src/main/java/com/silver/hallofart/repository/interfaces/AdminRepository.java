package com.silver.hallofart.repository.interfaces;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.AdminDto;
import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.repository.model.Show;

@Mapper
public interface AdminRepository {
	public List<Show> findAll(PagingDto paging);
	public int updateStatus(@Param("id") int id, @Param("showStatus") String showStatus);
	public AdminDto findCountAll();
	public List<PaymentDto> findMerchantAll(PagingDto paging);
	public List<AdminDto> findBookingAll(PagingDto paging);
	public int countShow(Pagination pagination);
	public int countBooking(Pagination pagination);
	public int countPayment(Pagination pagination);
}
