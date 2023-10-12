package com.silver.hallofart.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ApprovedCancelAmount {
	Integer total;
	Integer taxFree;
	Integer vat;
	Integer point;
	Integer discount;
	
}
