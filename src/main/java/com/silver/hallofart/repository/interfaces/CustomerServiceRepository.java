package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Inquiry;

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

	public int countInquiry(Pagination pagination);
	
	public Inquiry findInquiryById(int id);
}
