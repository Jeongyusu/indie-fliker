package com.tenco.indiepicter.runningschedule.response;

import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SelectRunningScheduleAndPlaceDTO {

    private Integer runningDateId;
    private String runningGrade;
    private Timestamp runningDate;
    private String startTime;
    private String endTime;
    private Integer movieId;
    private String movieName;
    private Integer theaterId;
    private String theaterName;
    private String theaterTel;
    private String theaterAddress;
    private Integer fundingId;
    private Integer totalCount;
    private Integer totalPrice;

    // yyyy-MM-dd
    public String formatToDate (){
        return TimeStampUtil.timeStampToDate(runningDate);
    }

    // HH:mm
    public String formatToStartTime (){
        return TimeStampUtil.timeToSubstring(startTime);
    }

    // HH:mm
    public String formatToEndTime (){ return TimeStampUtil.timeToSubstring(endTime);}

    // 천 단위
    public String formatToBalance (){ return BalanceUtil.formatBalance(totalPrice);
    }

}



