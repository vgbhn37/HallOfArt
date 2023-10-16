package com.silver.hallofart.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RentalInfoDto {

	private Integer showTbId;
	private String rentalStartTime;
	private String rentalEndTime;
	private String hallName;
	private Integer amount;
	private Timestamp createdAt;
	private String status;
}
