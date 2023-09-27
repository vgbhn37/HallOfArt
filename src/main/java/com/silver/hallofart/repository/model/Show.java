package com.silver.hallofart.repository.model;

import lombok.Data;

@Data
public class Show {
	private Integer id;					// id 키 값
	private String title;				// 제목
	private String content;			// 내용
	private String startDate;	// 시작하는 날짜
	private String endDate;	// 끝나는 날짜
	private String price;				// 가격
	private String showStatus;		// 공연 중
	private String show_img;			// 이미지 경로
	private Integer showTypeId1;	// ??
	private Integer hallTbId;			// ??
}