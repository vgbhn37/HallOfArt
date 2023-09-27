package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.interfaces.CustomerServiceRepository;
import com.silver.hallofart.repository.model.Announcement;

@Service
public class CustomerServiceService {

	@Autowired
	private CustomerServiceRepository customerServiceRepository;
	
	public List<Announcement> selectAllAnnouncement(PagingDto paging) {
		List<Announcement> announcementList = customerServiceRepository.findAllAnnouncement(paging);
		return announcementList;
	}
	
	public void insertAnnouncement(Announcement announcement) {
		customerServiceRepository.insertAnnouncement(announcement);
	}
	
	public int countPage(PagingDto paging) {
		int count = customerServiceRepository.count(paging);
		return count;
	}

	public Announcement findAnnouncementById(int id) {
		
		return customerServiceRepository.findAnnouncementById(id);
	}

	public void deleteAnnouncement(int id) {
		customerServiceRepository.deleteAnnouncement(id);
	}

	public void updateAnnouncement(Announcement announcement) {
		customerServiceRepository.updateAnnouncement(announcement);
		
	}
}
