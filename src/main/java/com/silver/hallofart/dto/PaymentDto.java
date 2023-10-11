package com.silver.hallofart.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentDto {
	private String tid;
	private int orderNumber;
	private String regDate;
	private int amount;
	private int refundedAmount;
}
