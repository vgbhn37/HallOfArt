package com.silver.hallofart.dto;

import lombok.Data;

@Data
public class AdminDto {
	private int totalUser;
	private int totalShow1;
	private int totalShow2;
	
	private String title;
	private int seatTbId;
	private int amount;
	private String reg_date;
}
