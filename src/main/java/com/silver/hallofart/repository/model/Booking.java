package com.silver.hallofart.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Booking {
	
	private Integer id;
	private String status;
	private Integer userTbId;
	private Integer seatTbId;
	private Integer showTimeTbId;
	private Integer showTbId;
	private String paymentTid;
	private Timestamp createdAt;
}
