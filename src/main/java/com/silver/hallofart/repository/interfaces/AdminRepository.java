package com.silver.hallofart.repository.interfaces;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.AdminDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.repository.model.Show;

@Mapper
public interface AdminRepository {
	public List<Show> findAll();
	public int updateStatus(@Param("id") int id, @Param("showStatus") String showStatus);
	public AdminDto findCountAll();
	public List<PaymentDto> findMerchantAll();
	public List<AdminDto> findBookingAll();
}
