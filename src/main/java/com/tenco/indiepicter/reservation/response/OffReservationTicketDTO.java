package com.tenco.indiepicter.reservation.response;

import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OffReservationTicketDTO {

    private String thumbnail;
    private String movieName;
    private Timestamp runningDate;
    private String startTime;
    private String endTime;
    private Integer audience; // 관람인원
    private String seats;
    private String theaterName;
    private Integer finalPrice;
    private String reservationCode;



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
    public String formatToBalance (){ return BalanceUtil.formatBalance(finalPrice);
    }
}

