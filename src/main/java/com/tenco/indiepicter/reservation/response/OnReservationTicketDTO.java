package com.tenco.indiepicter.reservation.response;

import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OnReservationTicketDTO {

    private String thumbnail;
    private String movieName;
    private String movieGenre;
    private Timestamp onlineReleaseDate;
    private Timestamp onlineEndDate;
    private Timestamp dDay;
    private Integer finalPrice;
    private String reservationCode;


    // yyyy-mm-dd
    public String formatToDDay(){
        return TimeStampUtil.timeStampToDate(dDay);
    }
    public String formatToReleaseDate(){
        return TimeStampUtil.timeStampToDate(onlineReleaseDate);
    }
    public String formatToEndDate(){
        return TimeStampUtil.timeStampToDate(onlineEndDate);
    }

    // 천 단위
    public String formatToBalance (){ return BalanceUtil.formatBalance(finalPrice);
    }
}

