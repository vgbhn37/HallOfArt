package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
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
		int result = customerServiceRepository.insertAnnouncement(announcement);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
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
		int result = customerServiceRepository.deleteAnnouncement(id);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public void updateAnnouncement(Announcement announcement) {
		int result =customerServiceRepository.updateAnnouncement(announcement);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public void insertInquiry(int id, Inquiry inquiry) {
		inquiry.setAnswer(0);
		inquiry.setUserId(id);
		int result = customerServiceRepository.insertInquiry(inquiry);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
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
		int result = customerServiceRepository.insertInquiryAnswer(inquiryAnswer);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	public InquiryAnswer findInquiryAnswer(Integer inquiryId) {
		return customerServiceRepository.findInquiryAnswer(inquiryId);
	}

	@Transactional
	public void updateInquiry(Inquiry inquiry) {
		int result = customerServiceRepository.updateInquiry(inquiry);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public void deleteInquiry(Integer id) {
		int result = customerServiceRepository.deleteInquiry(id);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public int changeAnswer(Integer id) {
		int result = customerServiceRepository.changeAnswer(id);
		return result;
	}
	
	@Transactional
	public void deleteAnswer(Integer id) {
		int result = customerServiceRepository.deleteAnswer(id);
		if(result !=1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	public List<Announcement> selectAnnouncement(PagingDto paging) {
		List<Announcement> announcementList = customerServiceRepository.findAnnouncement(paging);
		return announcementList;
	}

	public int countPageClassification(PagingDto paging) {
		int count = customerServiceRepository.countPageClassification(paging);
		return count;
	}

	public int countAllInquiryPage(PagingDto paging) {
		int count = customerServiceRepository.countAllInquiry(paging);
		return count;
	}

	public List<Inquiry> findAllInquiry(PagingDto paging) {
		List<Inquiry> inquiryList = customerServiceRepository.findAllInquiry(paging);
		return inquiryList;
	}

	public List<Inquiry> findNoAnswer(PagingDto paging) {
		List<Inquiry> inquiryList = customerServiceRepository.findNoAnswer(paging);
		return inquiryList;
	}

	public int countNoAnswer(PagingDto paging) {
		int count = customerServiceRepository.countNoAnswer(paging);
		return count;
	}

	public List<Announcement> selectMainAnnouncement() {
		List<Announcement> announcementList = customerServiceRepository.selectMainAnnouncement();
		return announcementList;
	}
}
