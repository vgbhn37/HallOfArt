package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.dto.AdminDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.repository.interfaces.AdminRepository;
import com.silver.hallofart.repository.model.Show;

@Service
public class AdminService {
	@Autowired
	private AdminRepository adminRepository;
	
	public List<Show> findAll(){
		List<Show> list = adminRepository.findAll();
		return list;
	}
	
	public int updateStatus(int id, String showStatus) {
		return adminRepository.updateStatus(id, showStatus);
	}
	
	public AdminDto findCountAll() {
		return adminRepository.findCountAll();
	}
	public List<PaymentDto> findMerchantAll() {
		return adminRepository.findMerchantAll();
	}
	
	public List<AdminDto> findBookingAll() {
		return adminRepository.findBookingAll();
	}
}
