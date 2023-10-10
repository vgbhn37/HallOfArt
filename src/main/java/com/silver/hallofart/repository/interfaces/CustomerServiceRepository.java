package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Inquiry;
import com.silver.hallofart.repository.model.InquiryAnswer;

@Mapper
public interface CustomerServiceRepository {
	public List<Announcement> findAllAnnouncement(PagingDto paging);
	
	public int count(Pagination pagination);

	public void insertAnnouncement(Announcement announcement);

	public Announcement findAnnouncementById(int id);

	public void deleteAnnouncement(int id);

	public void updateAnnouncement(Announcement announcement);

	public void insertInquiry(Inquiry inquiry);

	public List<Inquiry> findInquiryByUserId(PagingDto paging);

	public int countInquiry(PagingDto paging);
	
	public Inquiry findInquiryById(int id);

	public void insertInquiryAnswer(InquiryAnswer inquiryAnswer);

	public void modifyinquiryAnswer(Integer inquiryId);

	public InquiryAnswer findInquiryAnswer(Integer inquiryId);

	public void updateInquiry(Inquiry inquiry);

	public void deleteInquiry(Integer id);

	public int changeAnswer(Integer id);

	public void deleteAnswer(Integer id);

	public List<Announcement> findAnnouncement(PagingDto paging);

	public int countPageClassification(PagingDto paging);
}
