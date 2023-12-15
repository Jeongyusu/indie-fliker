package com.tenco.indiepicter.notice.response;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class NoticePagingResponseDTO {
	
	private Integer page; // 현재 페이지
	private Integer maxPage; // 전체 필요한 페이지 갯수
	private Integer startPage; // 현제 페이지 기준 시작 페이지 값
	private Integer endPage; // 현제 페이지 기준 마지막 페이지 값
	
}
