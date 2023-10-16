package com.silver.hallofart.dto;

import java.util.List;

import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Inquiry;

import lombok.Data;

@Data
public class ClassificationDto {
	List<Announcement> announcementList;
	List<Inquiry> inquiryList;
	Pagination pagination;
}
