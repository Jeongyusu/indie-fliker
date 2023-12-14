package com.tenco.indiepicter.reservation.response;

import lombok.Data;

import java.util.List;

@Data
public class ReservationTicketDTO {

    private String thumbnail;
    private String movieName;
    private String startTime;
    private String endTime;
    private String Audience;
    private List<String> seatNames;
    private String theaterName;
    private Integer finalPrice;
    private String reservationCode;
}
