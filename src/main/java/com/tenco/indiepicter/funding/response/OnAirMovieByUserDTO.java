package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OnAirMovieByUserDTO {
    private Integer fundingId;
    private Integer movieId;
    private String movieThumbnail;
    private String movieName;
    private String runningGrade;
    private String synopsis;
    private Timestamp onlineReleaseDate;
    private Timestamp onlineEndDate;
    private Integer fundingRate;
    private String production;
    private Timestamp reservatedAt;


    public String formatReleaseDate (){
        return TimeStampUtil.timeStampToDate(onlineReleaseDate);
    }
    public String formatEndDate (){
        return TimeStampUtil.timeStampToDate(onlineEndDate);
    }

    public String period(){
        return formatReleaseDate() + " ~ " + formatEndDate();
    }
    public String formatDDay(){
        return TimeStampUtil.dDayFormatToDate(reservatedAt);
    }
}

