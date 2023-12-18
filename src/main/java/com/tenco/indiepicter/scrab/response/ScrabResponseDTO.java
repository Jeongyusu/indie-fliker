package com.tenco.indiepicter.scrab.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tenco.indiepicter._core.utils.BalanceUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.DecimalFormat;

@Data
public class ScrabResponseDTO {
    private Integer fundingId; // 펀딩아이디
    private String thumbnail;  // 썸네일

    // @JsonIgnore 어노테이션을 사용하여 직렬화에서 제외
    @JsonIgnore
    private Integer targetPrice; // 목표금액

    // @JsonIgnore 어노테이션을 사용하여 직렬화에서 제외
    @JsonIgnore
    private Integer presentPrice; // 현재금액

    private String movieName; // 영화제목
    private String synopsis; // 시놉시스
    private String production; // 배급사

    // 달성률 계산 및 정수 값 포맷
    public String calculateAndSetAchievementRate(){
        return BalanceUtil.calculateAndSetAchievementRate(targetPrice, presentPrice);
    }
}
