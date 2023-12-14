package com.tenco.indiepicter.reservation.request;

import lombok.Data;

@Data
public class SaveReservationDTO {
    private Integer movieId;
    private Integer runningDateId;
    private String reservationCode;
    private Integer userId;
    private Integer seatId;
}
