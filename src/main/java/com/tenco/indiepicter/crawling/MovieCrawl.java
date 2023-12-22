package com.tenco.indiepicter.crawling;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
public class MovieCrawl {
    private Integer id;
    private String makeYear; // 제작년도
    private String production; // 영화사
    private String movieName; // 영화제목
    private String synopsis; // 시놉시스
    private String thumbnail; // 영화 이미지
    private String directingIntension; // 연출의도
    private String genre; // 장르
    private String runningGrade; // 등급
    private String director; // 감독
    private String directorPic; // 감독 사진
    private String actor; // 배우
    private String directorCareers; // 감독 경력
    private String directorAwardsFilm; // 수상 경력
    private LocalDate onlineReleaseDate; // 온라인 릴리스 날짜
    private LocalDate onlineEndDate; // 온라인 마감 날짜
    private LocalDate offlineReleaseDate; // 오프라인 릴리스 날짜
    private LocalDate offlineEndDate; // 오프라인 마감 날짜
    private LocalDate dDay; // 디데이
    //    ----------------------
    private String eDirector; // 감독
    private String filming; // 촬영
    private String art; // 미술
    private String sound; // 사운드
    private String clothes; // 의상
    private String script; // 스크립트
    private String lighting; // 조명
    private String editing; // 편집
    private String music; // 음악

    // =========
    private String moviePic;


    @Builder
    public MovieCrawl(Integer id, String makeYear, String production, String movieName, String synopsis, String thumbnail, String directingIntension, String genre, String runningGrade, String director, String directorPic, String actor, String directorCareers, String directorAwardsFilm, LocalDate onlineReleaseDate, LocalDate onlineEndDate, LocalDate offlineReleaseDate, LocalDate offlineEndDate, LocalDate dDay, String eDirector, String filming, String art, String sound, String clothes, String script, String lighting, String editing, String music, String moviePic) {
        this.id = id;
        this.makeYear = makeYear;
        this.production = production;
        this.movieName = movieName;
        this.synopsis = synopsis;
        this.thumbnail = thumbnail;
        this.directingIntension = directingIntension;
        this.genre = genre;
        this.runningGrade = runningGrade;
        this.director = director;
        this.directorPic = directorPic;
        this.actor = actor;
        this.directorCareers = directorCareers;
        this.directorAwardsFilm = directorAwardsFilm;
        this.onlineReleaseDate = onlineReleaseDate;
        this.onlineEndDate = onlineEndDate;
        this.offlineReleaseDate = offlineReleaseDate;
        this.offlineEndDate = offlineEndDate;
        this.dDay = dDay;
        this.eDirector = eDirector;
        this.filming = filming;
        this.art = art;
        this.sound = sound;
        this.clothes = clothes;
        this.script = script;
        this.lighting = lighting;
        this.editing = editing;
        this.music = music;
        this.moviePic = moviePic;
    }
}
