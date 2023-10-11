package com.silver.hallofart.dto;

import lombok.Data;

@Data
public class ShowDetailDto {
	private Integer id;					// id 키 값
	private String title;				// 제목
	private String content;			// 내용
	private String startDate;	// 시작하는 날짜
	private String endDate;	// 끝나는 날짜
	private Integer price;				// 가격
	private String showStatus;		// 공연 중 / 승인 요청 중
	private String showImg;			// 이미지 경로
	private Integer showTypeId1;	// 공연/전시
	private Integer hallTbId;			// 장소
	private String name; 				// 홀 이름 ( A 관 .. )
}
