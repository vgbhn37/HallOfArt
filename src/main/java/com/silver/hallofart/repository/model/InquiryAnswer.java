package com.silver.hallofart.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class InquiryAnswer {
	private Integer id;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Integer inquiryId;
}
