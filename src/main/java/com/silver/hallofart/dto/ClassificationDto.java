package com.silver.hallofart.dto;

import java.util.List;

import com.silver.hallofart.repository.model.Announcement;

import lombok.Data;

@Data
public class ClassificationDto {
	List<Announcement> announcementList;
	Pagination pagination;
}
