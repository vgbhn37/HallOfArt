package com.silver.hallofart.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ShowTime {
	private Integer id;
	private Timestamp startTime;
	private Integer showId;
	
}
