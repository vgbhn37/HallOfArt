package com.silver.hallofart.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BookedSeatDto {
	
	private Integer bookingId;
	private String title;
	private String hallName;
	private String seatName;
	private Integer price;
	private Timestamp startTime;
}
