package com.silver.hallofart.dto;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserDto {

	private int id;
	private String username;
	private String password;
	private String email;
	private String tel;
	private Date birthDate;
	private Timestamp regDate;
	private int roleTypeId;
	
}
