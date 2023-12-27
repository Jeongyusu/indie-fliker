package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OnDDayMovieDTO {
    private Integer fundingId;
    private String movieThumbnail;
    private String movieName;
    private String runningGrade;
    private String synopsis;
    private Timestamp dDay;
    private Integer fundingRate;
    private String production;

    public String formatDday (){
        return TimeStampUtil.timeStampToDate(dDay);
    }

}

