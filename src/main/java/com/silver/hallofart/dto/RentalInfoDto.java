package com.silver.hallofart.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RentalInfoDto {

	private Integer showTbId;
	private Timestamp rentalStartTime;
	private Timestamp rentalEndTime;
	private String hallName;
	private Integer amount;
	private Timestamp createdAt;
	private String status;
	private String title;
	private String name;
	private String username;
}
