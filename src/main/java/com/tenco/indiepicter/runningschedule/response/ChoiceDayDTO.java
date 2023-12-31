package com.tenco.indiepicter.runningschedule.response;

import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChoiceDayDTO {
    private Integer runningDateId;
    private String movieName;
    private Integer pricePerOnetime; // 펀딩 1개 또는 티켓 1개 금액
    private String thumbnail;
    private String runningGrade;
    private Timestamp runningDate;
    private Integer movieId;
    private Integer theaterId;
    private String startTime;
    private String endTime;
    private List<ExistSeatDTO> existSeatDTOS;

    // yyyy-MM-dd
    public String formatToDate (){
        return TimeStampUtil.timeStampToDate(runningDate);
    }

    // HH:mm
    public String formatToStartTime (){

        return TimeStampUtil.timeToSubstring(startTime);
    }

    // HH:mm
    public String formatToEndTime (){

        return TimeStampUtil.timeToSubstring(endTime);
    }

    // 천 단위
    public String formatToBalance (){
        return BalanceUtil.formatBalance(pricePerOnetime);
    }

}
