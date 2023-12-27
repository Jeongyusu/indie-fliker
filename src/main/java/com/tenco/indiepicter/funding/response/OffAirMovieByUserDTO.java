package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OffAirMovieByUserDTO {
    private Integer fundingId;
    private Integer movieId;
    private String movieThumbnail;
    private String movieName;
    private String runningGrade;
    private String synopsis;
    private Timestamp offlineReleaseDate;
    private Timestamp offlineEndDate;
    private Integer fundingRate;
    private String production;
    private Timestamp reservatedAt;


    public String formatReleaseDate (){
        return TimeStampUtil.timeStampToDate(offlineReleaseDate);
    }
    public String formatEndDate (){
        return TimeStampUtil.timeStampToDate(offlineEndDate);
    }

    public String period(){
        return formatReleaseDate() + " ~ " + formatEndDate();
    }

    public String formatReservatedAt(){
        return  TimeStampUtil.timeStampToDate(reservatedAt);
    }
}

