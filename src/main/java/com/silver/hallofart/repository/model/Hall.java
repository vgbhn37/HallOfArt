package com.silver.hallofart.repository.model;

import lombok.Data;

@Data
public class Hall {
	private Integer id;
	private String name;
	private Integer maxSeat;
	private Integer hallTypeId;
	private Integer basicPrice;
	private Integer perTimePrice;
}
