package com.tenco.indiepicter.order.response;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderAndReservationInfoDTO {
    private Integer orderId;
    private String seats;
    private Integer productPrice;
    private Integer quantity;
    private Integer fundingId;
    private Integer reservationId;
    private String reservationCode;
    private Timestamp reservationAt;
    private Integer seatId;

}
