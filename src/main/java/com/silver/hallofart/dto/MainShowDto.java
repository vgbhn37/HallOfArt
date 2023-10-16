package com.silver.hallofart.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MainShowDto {

	private Integer id;
	private String showType;
	private String hallName;
	private String title;
	private String startDate;
	private String endDate;
	private String showImg;
}
