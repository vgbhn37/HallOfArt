package com.silver.hallofart.repository.model;

import lombok.Data;

@Data
public class Rental {
	private int showTbId;
	private int hallTbId;
	private int userTbId;
	private String rentalStartTime; 
	private String rentalEndTime; 
}
