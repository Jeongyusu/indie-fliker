package com.tenco.indiepicter.movie.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter.movie.moviephoto.MoviePhoto;
import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

@Data
public class OnMovieDetailDTO {
    private Integer fundingId;
    private Integer movieId;
    private String movieName;
    private String thumbnail;
    private String director;
    private String genre;
    private String runningGrade;
    private LocalDate onlineReleaseDate;
    private LocalDate onlineEndDate;
    private Timestamp chatTime;
    private String synopsis;
    private String moviePath;
    private List<MoviePhoto> moviePics;


    public String chatFormat (){
        return TimeStampUtil.timeStampToString(chatTime);
    }
}


