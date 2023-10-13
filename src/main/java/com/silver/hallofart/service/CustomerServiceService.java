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
	
	@Transactional
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

	@Transactional
	public void deleteAnnouncement(int id) {
		customerServiceRepository.deleteAnnouncement(id);
	}

	@Transactional
	public void updateAnnouncement(Announcement announcement) {
		customerServiceRepository.updateAnnouncement(announcement);
	}

	@Transactional
	public void insertInquiry(int id, Inquiry inquiry) {
		inquiry.setAnswer(0);
		inquiry.setUserId(id);
		customerServiceRepository.insertInquiry(inquiry);
	}

	public List<Inquiry> findInquiry(int id, PagingDto paging) {
		List<Inquiry> inquiryList = customerServiceRepository.findInquiryByUserId(id, paging);
		return inquiryList;
	}

	public int countInquiryPage(PagingDto paging) {
		int count = customerServiceRepository.countInquiry(paging);
		return count;
	}

	public Inquiry findInquiryById(Integer id) {
		return customerServiceRepository.findInquiryById(id);
	}

	@Transactional
	public void insertInquiryAnswer(InquiryAnswer inquiryAnswer) {
		//inquiry테이블에 답변 여부 수정
		customerServiceRepository.modifyinquiryAnswer(inquiryAnswer.getInquiryId());
		customerServiceRepository.insertInquiryAnswer(inquiryAnswer);
	}

	public InquiryAnswer findInquiryAnswer(Integer inquiryId) {
		return customerServiceRepository.findInquiryAnswer(inquiryId);
	}

	@Transactional
	public void updateInquiry(Inquiry inquiry) {
		customerServiceRepository.updateInquiry(inquiry);		
	}

	@Transactional
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
