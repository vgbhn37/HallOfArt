package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.silver.hallofart.repository.model.Announcement;

@Mapper
public interface CustomerServiceRepository {
	public List<Announcement> findAllAnnouncement();
}
