package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Time;
import java.sql.Timestamp;

@Data
public class AdminOnFundingListDTO {
    private String movieId;
    private String thumbnail;
    private String movieName;
    private Timestamp releaseDate;
    private Timestamp endDate;


    public String formatToReleaseDate () {
        return TimeStampUtil.timeStampToDate(releaseDate);
    }

    public String formatToEndDate () {
        return TimeStampUtil.timeStampToDate(endDate);
    }
}
