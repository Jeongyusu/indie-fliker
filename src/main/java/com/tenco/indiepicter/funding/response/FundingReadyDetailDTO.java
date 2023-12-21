package com.tenco.indiepicter.funding.response;


import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class FundingReadyDetailDTO {
    // 펀딩 ID(PK)
    private int fundingId;
    // 펀딩 대표 사진
    private String movieThumbnail;
    // 개봉 여부
    private String isOpen;
    // 영화 장르
    private String genre;
    // 펀딩 달성률
    private int fundingRate;
    // 펀딩 남은 기간
    private int restPeriod;
    // 펀딩 달성액
    private int fundingPresentPrice;
    // 펀딩 참여 인원
    private int peopleCount;
    // 펀딩 제목(영화 제목)
    private String movieName;
    // 펀딩 구매 가격
    private int fundingProductPrice;
    // 진행 기간
    private String fundingPeriod;
    // 좋아요 여부
    private boolean isLiked;
    // 상영 예정일
    private Timestamp dDay;
    // 영화 감독 이미지
    private String directorPic;
    // 시놉시스
    private String synopsis;
    // 연출 의도
    private String directingIntension;
    // 포토 목록
    private List<String> moviePhotos;
    // 감독 작품 경력
    private String directorCareers;
    // 영화제 상영 및 수상작
    private String directorAwardsFilm;
    //영화 스태프
    private String director;
    private String filming;
    private String art;
    private String sound;
    private String clothes;
    private String script;
    private String lighting;
    private String editing;
    private String music;

    public String formatPresentPrice(){
        return BalanceUtil.formatBalance(fundingPresentPrice);
    }

    public String formatFundingProductPrice(){
        return BalanceUtil.formatBalance(fundingProductPrice);
    }

    public String formatTimeStamp(){
        return TimeStampUtil.timeStampToDate(dDay);
    }
}
