package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Inquiry;
import com.silver.hallofart.repository.model.InquiryAnswer;

@Mapper
public interface CustomerServiceRepository {
	public List<Announcement> findAllAnnouncement(PagingDto paging);
	
	public int count(Pagination pagination);

	public int insertAnnouncement(Announcement announcement);

	public Announcement findAnnouncementById(int id);

	public int deleteAnnouncement(int id);

	public int updateAnnouncement(Announcement announcement);

	public int insertInquiry(Inquiry inquiry);

	public List<Inquiry> findInquiryByUserId(@Param("id")int id, @Param("paging")PagingDto paging);

	public int countInquiry(PagingDto paging);
	
	public Inquiry findInquiryById(int id);

	public int insertInquiryAnswer(InquiryAnswer inquiryAnswer);

	public int modifyinquiryAnswer(Integer inquiryId);

	public InquiryAnswer findInquiryAnswer(Integer inquiryId);

	public int updateInquiry(Inquiry inquiry);

	public int deleteInquiry(Integer id);

	public int changeAnswer(Integer id);

	public int deleteAnswer(Integer id);

	public List<Announcement> findAnnouncement(PagingDto paging);

	public int countPageClassification(PagingDto paging);

	public int countAllInquiry(PagingDto paging);

	public List<Inquiry> findAllInquiry(PagingDto paging);

	public List<Inquiry> findNoAnswer(PagingDto paging);

	public int countNoAnswer(PagingDto paging);
}
