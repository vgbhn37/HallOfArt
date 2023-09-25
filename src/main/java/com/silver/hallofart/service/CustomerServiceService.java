package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.repository.interfaces.CustomerServiceRepository;
import com.silver.hallofart.repository.model.Announcement;

@Service
public class CustomerServiceService {

	@Autowired
	private CustomerServiceRepository customerServiceRepository;
	
	public List<Announcement> selectAllAnnouncement() {
		List<Announcement> announcementList = customerServiceRepository.findAllAnnouncement();
		return announcementList;
	}
}
