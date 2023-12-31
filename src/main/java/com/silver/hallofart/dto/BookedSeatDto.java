package com.silver.hallofart.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BookedSeatDto {
	
	private Integer bookingId;
	private String title;
	private String hallName;
	private String seatName;
	private String showImg;
	private Integer price;
	private Integer quantity;
	private Timestamp startTime;
}
