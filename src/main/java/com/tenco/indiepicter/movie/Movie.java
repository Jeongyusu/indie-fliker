package com.tenco.indiepicter.movie;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
public class Movie {
    private Integer id;
    private String makeYear;
    private String production;
    private String movieName;
    private String synopsis;
    private String thumbnail;
    private String directingIntension;
    private String genre;
    private String runningGrade;
    private String director;
    private String directorPic;
    private String actor;
    private String directorCareers;
    private String directorAwardsFilm;
    private LocalDate onlineReleaseDate;
    private LocalDate onlineEndDate;
    private LocalDate offlineReleaseDate;
    private LocalDate offlineEndDate;
    private LocalDate dDay;
    private LocalDateTime chatTime;

    @Builder
    public Movie(Integer id, String makeYear, String production, String movieName, String synopsis, String thumbnail, String directingIntension, String genre, String runningGrade, String director, String directorPic, String actor, String directorCareers, String directorAwardsFilm, LocalDate onlineReleaseDate, LocalDate onlineEndDate, LocalDate offlineReleaseDate, LocalDate offlineEndDate, LocalDate dDay, LocalDateTime chatTime) {
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
        this.chatTime = chatTime;
    }
}
