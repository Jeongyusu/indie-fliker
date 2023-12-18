package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class SelectFundingDTO {

    private Integer fundingId;
    private Integer movieId;
    private String movieName;
    private String synopsis;
    private String thumbnail;
    private String runningGrade;
    private String director;
    private String script;
    private Timestamp dDay;
    private Timestamp onlineReleaseDate;
    private Timestamp onlineEndDate;

    // yyyy-MM-dd
    public String formatToDDay (){
        return TimeStampUtil.timeStampToDate(dDay);
    }
    public String formatToReleaseDate () {
        return TimeStampUtil.timeStampToDate(onlineReleaseDate);
    }
    public String formatToEndDate () {
        return TimeStampUtil.timeStampToDate(onlineEndDate);
    }

}
