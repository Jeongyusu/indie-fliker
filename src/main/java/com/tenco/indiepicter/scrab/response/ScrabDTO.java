package com.tenco.indiepicter.scrab.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScrabDTO {
    private Integer fundingId; // 펀딩아이디
    private String thumbnail;  // 썸네일

    // @JsonIgnore 어노테이션을 사용하여 직렬화에서 제외
    @JsonIgnore
    private Integer targetPrice; // 목표금액

    // @JsonIgnore 어노테이션을 사용하여 직렬화에서 제외
    @JsonIgnore
    private Integer presentPrice; // 현재금액

    private Double achievementRate; // 달성률

    private String movieName; // 영화제목
    private String synopsis; // 시놉시스
    private String production; // 배급사

    public ScrabDTO(Integer fundingId, String thumbnail, Integer targetPrice, Integer presentPrice, String movieName, String synopsis, String production) {
        this.fundingId = fundingId;
        this.thumbnail = thumbnail;
        this.targetPrice = targetPrice;
        this.presentPrice = presentPrice;
        this.movieName = movieName;
        this.synopsis = synopsis;
        this.production = production;
        calculateAndSetAchievementRate();
    }

    public void calculateAndSetAchievementRate() {
        System.out.println("targetPrice: " + targetPrice);
        System.out.println("presentPrice: " + presentPrice);

        if (targetPrice == 0) {
            this.achievementRate = 0.0;
        } else {
            double rawAchievementRate = (double) presentPrice / targetPrice * 100;
            this.achievementRate = Math.round(rawAchievementRate * 10.0) / 10.0; // 반올림하여 소수점 아래 한 자리까지 표시
        }

        System.out.println("calculated achievementRate: " + achievementRate);
    }
}
