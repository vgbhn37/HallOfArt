package com.silver.hallofart.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserClassificationDto {
	List<UserDto> userList;
	Pagination pagination;
}
