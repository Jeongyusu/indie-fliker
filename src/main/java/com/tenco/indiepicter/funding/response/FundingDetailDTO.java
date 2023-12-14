package com.tenco.indiepicter.funding.response;


import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class FundingDetailDTO {
    // 펀딩 ID(PK)
    private int fundingId;
    // 펀딩 대표 사진
    private String movieThumbnail;
    // 개봉 여부
    private boolean isOpen;
    // 영화 장르
    private String genre;
    // 펀딩 달성률
    private int fundingRate;
    // 펀딩 남은 기간
    private int restPeriod;
    // 펀딩 달성액
    private int fundingTotalPrice;
    // 펀딩 참여 인원
    private int peopleCount;
    // 펀딩 제목
    private String fundingTitle;
    // 펀딩 구매 가격
    private int fundingProductPrice;
    // 진행 기간
    private String fundingPeriod;
    // 좋아요 여부
    private boolean isLiked;
    // 상영 예정일
    private Timestamp dDay;
    // 시놉시스
    private String synopsis;
    // 연출 의도
    private String directingIntension;
    // 스태프
    private String staff;
    // 포토 목록
    private List<String> moviePhotos;
    // 감독 작품 경력
    private String directorCareers;
    // 영화제 상영 및 수상작
    private String directorAwards;
}
