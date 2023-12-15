package com.tenco.indiepicter.user.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
//JSON 형식에 코딩 컨벤션의 스테이크 케이스를 자바 카멜 노테이션으로 변환 처리
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoProfile {
	
	private Long id;
	private String connectedAt;
	private Properties properties;

}
