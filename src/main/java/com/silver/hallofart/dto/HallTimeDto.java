package com.silver.hallofart.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HallTimeDto {
	private Timestamp startDate;
	private Timestamp endDate;
	private String name;
}
