package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.dto.AdminDto;
import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.repository.interfaces.AdminRepository;
import com.silver.hallofart.repository.model.Show;

@Service
public class AdminService {
	@Autowired
	private AdminRepository adminRepository;
	
	public List<Show> findAll(PagingDto paging){
		return adminRepository.findAll(paging);
	}
	
	public List<Show> findShowBySearch(PagingDto paging, String search){
		return adminRepository.findShowBySearch(paging, search);
	}
 	
	public int updateStatus(int id, String showStatus) {
		return adminRepository.updateStatus(id, showStatus);
	}
	
	public AdminDto findCountAll() {
		return adminRepository.findCountAll();
	}
	public List<PaymentDto> findMerchantAll(PagingDto paging) {
		return adminRepository.findMerchantAll(paging);
	}
	
	public List<AdminDto> findBookingAll(PagingDto paging) {
		return adminRepository.findBookingAll(paging);
	}
	
	public int countShow(Pagination pagination) {
		return adminRepository.countShow(pagination);
	}
	
	public int countBooking(Pagination pagination) {
		return adminRepository.countBooking(pagination);
	}
	
	public int countPayment(Pagination pagination) {
		return adminRepository.countPayment(pagination);
	}
}
