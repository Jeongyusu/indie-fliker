package com.tenco.indiepicter.movie;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Movie {
    private Integer id;
    private Integer makeYear;
    private String production;
    private String movieName;
    private String synopsis;
    private String thumbnail;
    private String directingIntension;
    private String genre;
    private String runningGrade;
    private String director;
    private String actor;
    private String directorCareers;
    private String directorAwardsFilm;
    private Timestamp onlineReleaseDate;
    private Timestamp onlineEndDate;
    private Timestamp offlineReleaseDate;
    private Timestamp offlineEndDate;

    @Builder
    public Movie(Integer id, Integer makeYear, String production, String movieName, String synopsis, String thumbnail, String directingIntension, String genre, String runningGrade, String director, String actor, String directorCareers, String directorAwardsFilm, Timestamp onlineReleaseDate, Timestamp onlineEndDate, Timestamp offlineReleaseDate, Timestamp offlineEndDate) {
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
        this.actor = actor;
        this.directorCareers = directorCareers;
        this.directorAwardsFilm = directorAwardsFilm;
        this.onlineReleaseDate = onlineReleaseDate;
        this.onlineEndDate = onlineEndDate;
        this.offlineReleaseDate = offlineReleaseDate;
        this.offlineEndDate = offlineEndDate;
    }
}
