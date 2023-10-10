package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.interfaces.CustomerServiceRepository;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Inquiry;
import com.silver.hallofart.repository.model.InquiryAnswer;

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
	
	public int countPage(Pagination pagination) {
		int count = customerServiceRepository.count(pagination);
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

	public void insertInquiry(Inquiry inquiry) {
		inquiry.setAnswer(0);
		inquiry.setUser_id(1);
		customerServiceRepository.insertInquiry(inquiry);
	}

	public List<Inquiry> findInquiry(PagingDto paging) {
		List<Inquiry> inquiryList = customerServiceRepository.findInquiryByUserId(paging);
		return inquiryList;
	}

	public int countInquiryPage(PagingDto paging) {
		int count = customerServiceRepository.countInquiry(paging);
		return count;
	}

	public Inquiry findInquiryById(Integer id) {
		return customerServiceRepository.findInquiryById(id);
	}

	public void insertInquiryAnswer(InquiryAnswer inquiryAnswer) {
		//inquiry테이블에 답변 여부 수정
		customerServiceRepository.modifyinquiryAnswer(inquiryAnswer.getInquiryId());
		customerServiceRepository.insertInquiryAnswer(inquiryAnswer);
	}

	public InquiryAnswer findInquiryAnswer(Integer inquiryId) {
		return customerServiceRepository.findInquiryAnswer(inquiryId);
	}

	public void updateInquiry(Inquiry inquiry) {
		customerServiceRepository.updateInquiry(inquiry);		
	}

	public void deleteInquiry(Integer id) {
		customerServiceRepository.deleteInquiry(id);
	}

	@Transactional
	public int changeAnswer(Integer id) {
		int result = customerServiceRepository.changeAnswer(id);
		return result;
	}
	
	@Transactional
	public void deleteAnswer(Integer id) {
		customerServiceRepository.deleteAnswer(id);	
	}

	public List<Announcement> selectAnnouncement(PagingDto paging) {
		List<Announcement> announcementList = customerServiceRepository.findAnnouncement(paging);
		return announcementList;
	}

	public int countPageClassification(PagingDto paging) {
		int count = customerServiceRepository.countPageClassification(paging);
		return count;
	}

}
