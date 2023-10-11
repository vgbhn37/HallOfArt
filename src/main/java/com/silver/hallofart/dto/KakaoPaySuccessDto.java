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
public class KakaoPaySuccessDto {
	String aid;
	String tid;
	String cid;
	String partner_order_id;
	String partner_user_id;
	Amount amount;
	String approve_at;
}
