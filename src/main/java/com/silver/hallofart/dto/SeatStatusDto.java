package com.silver.hallofart.dto;

import lombok.Data;

@Data
public class SeatStatusDto {

	private Integer id; // 좌석 id
	private String seatName; // 좌석 이름
	private Integer hallTbId; // 홀 id
	private String status; // 좌석 예매 상태 (정상(예약됨), 결제대기, 취소)
	private Integer showTimeTbId; // 공연 시간 정보 id
	private Integer showTbId; // 공연 테이블 id
	
}
