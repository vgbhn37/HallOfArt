package com.silver.hallofart.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoPayResponseDto {
	
	private String tid;
	private String nextRedirectAppUrl;
	private String nextRedirectMobileUrl;
	private String nextRedirectPcUrl;
	private String createdAt; 
	
}
