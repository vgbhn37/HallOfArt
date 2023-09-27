package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.model.Announcement;

@Mapper
public interface CustomerServiceRepository {
	public List<Announcement> findAllAnnouncement(PagingDto paging);
	
	public int count(PagingDto paging);

	public void insertAnnouncement(Announcement announcement);

	public Announcement findAnnouncementById(int id);

	public void deleteAnnouncement(int id);

	public void updateAnnouncement(Announcement announcement);
}
