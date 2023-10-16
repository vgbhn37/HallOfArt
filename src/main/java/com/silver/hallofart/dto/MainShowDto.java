package com.silver.hallofart.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class MainShowDto {

	private Integer id;
	private String showType;
	private String hallName;
	private String title;
	private String startDate;
	private String endDate;
	private String showImg;
}
