package com.tenco.indiepicter.order.response;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class LastOrderDTO {

    private Integer movieId;
    private String seatNames;
    private Integer runningDateId;
    private String reservationCode;
    private Integer unitPrice; // 단일 가격
    private String totalPrice;
    private Integer totalCount;
    private Integer fundingId;
    private Integer discountPrice; // 할인 가격, 디폴트 = 0
    private Integer paymentTypeId;

}