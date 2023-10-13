package com.silver.hallofart.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria {
	private int pageNum;//페이지 번호
	private int amount;//페이지당 글 갯수
	
//	public Criteria() {
////		초기페이지는 1이고, 10개씩 출력
//		this(1, 10);
////		2:11~, 3:21~, 4:31~, 5:41~
////		this(5, 10);
//	}
}
