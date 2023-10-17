package com.silver.hallofart.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Rental {
	private int showTbId;
	private int hallTbId;
	private int userTbId;
	private String rentalStartTime; 
	private String rentalEndTime; 
	private String status;
	private Integer amount;
	private Timestamp createdAt;
	private String paymentTid;
}
