package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OnAirMovieRankingDTO {
    private Integer fundingId;
    private String movieThumbnail;
    private String movieName;
    private String runningGrade;
    private String synopsis;
    private Timestamp onlineReleaseDate;
    private Timestamp onlineEndDate;
    private Integer fundingRate;
    private String production;

    public String formatReleaseDate (){
        return TimeStampUtil.timeStampToDate(onlineReleaseDate);
    }
    public String formatEndDate (){
        return TimeStampUtil.timeStampToDate(onlineEndDate);
    }

    public String period(){
        return formatReleaseDate() + " ~ " + formatEndDate();
    }
}
