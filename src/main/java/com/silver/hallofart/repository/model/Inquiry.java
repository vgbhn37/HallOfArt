package com.silver.hallofart.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Inquiry {
	private Integer id;
	private String classification;
	private String title;
	private String content;
	private String file;
	private Timestamp createdAt;
	private Integer answer;
	private Integer userId;
}
