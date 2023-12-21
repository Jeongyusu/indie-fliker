package com.tenco.indiepicter.Crawling;

import lombok.Builder;
import lombok.Data;

@Data
public class MovieCrawl {
    private Integer id; // 엔터티의 고유 식별자
    private String imageUrl; // 이미지
    private String title; // 영화 제목
    private String englishName; // 영어 제목
    private String year; // 개봉 년도
    private String genre; // 장르
    private String duration; // 상영 시간
    private String rating; // 등급
    private String color; // 컬러 여부
    private String productionCompany; // 제작사
    private String distributionCompany; // 배급사
    private String director; // 감독
    private String cast; // 출연진
    private String keywords; // 키워드
    private String synopsis; // 시놉시스 (줄거리)
    private String directorIntention; // 연출 의도
    private String screeningAndAwards; // 영화제 상영 및 수상작
    private String directorFilmography; // 감독 작품 경력
    private String photoUrls; //포토
    private String screenplay; // 각본
    private String production; // 제작
    private String producer; // 프로듀서
    private String filming; // 촬영
    private String lighting; // 조명
    private String art; // 미술
    private String editing; // 편집
    private String recording; // 동시녹음
    private String sound; // 사운드
    private String music; // 음악
    private String clothes; // 의상
    private String dressing; // 분장


    @Builder

    public MovieCrawl(Integer id, String imageUrl, String title,
                      String englishName, String year, String genre,
                      String duration, String rating, String color,
                      String productionCompany, String distributionCompany,
                      String director, String cast, String keywords, String synopsis,
                      String directorIntention, String screeningAndAwards, String directorFilmography,
                      String photoUrls, String screenplay, String production, String producer,
                      String filming, String lighting, String art, String editing, String recording,
                      String sound, String music, String clothes, String dressing) {
        this.id = id;
        this.imageUrl = imageUrl;
        this.title = title;
        this.englishName = englishName;
        this.year = year;
        this.genre = genre;
        this.duration = duration;
        this.rating = rating;
        this.color = color;
        this.productionCompany = productionCompany;
        this.distributionCompany = distributionCompany;
        this.director = director;
        this.cast = cast;
        this.keywords = keywords;
        this.synopsis = synopsis;
        this.directorIntention = directorIntention;
        this.screeningAndAwards = screeningAndAwards;
        this.directorFilmography = directorFilmography;
        this.photoUrls = photoUrls;
        this.screenplay = screenplay;
        this.production = production;
        this.producer = producer;
        this.filming = filming;
        this.lighting = lighting;
        this.art = art;
        this.editing = editing;
        this.recording = recording;
        this.sound = sound;
        this.music = music;
        this.clothes = clothes;
        this.dressing = dressing;
    }
}
