package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OffAirMovieRankingDTO {
    private Integer fundingId;
    private String movieThumbnail;
    private String movieName;
    private String runningGrade;
    private String synopsis;
    private Timestamp offlineReleaseDate;
    private Timestamp offlineEndDate;
    private Integer fundingRate;
    private String production;

    public String formatReleaseDate (){
        return TimeStampUtil.timeStampToDate(offlineReleaseDate);
    }
    public String formatEndDate (){
        return TimeStampUtil.timeStampToDate(offlineEndDate);
    }
    public String period(){
        return formatReleaseDate() + " ~ " + formatEndDate();
    }
}
