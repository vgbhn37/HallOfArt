package com.silver.hallofart.repository.model;

import lombok.Data;

@Data
public class Hall {
	private int id;
	private String name;
	private int maxSeat;
	private String status;
	private int hallTypeId;
}
