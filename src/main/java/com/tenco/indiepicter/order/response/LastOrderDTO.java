package com.tenco.indiepicter.order.response;

import lombok.Data;

@Data
public class LastOrderDTO {

    private Integer movieId;
    private String seatNames;
    private Integer runningDateId;
    private String reservationCode;
    private Integer unitPrice; // 단일 가격
    private Integer finalPrice;
    private Integer totalCount;
    private Integer fundingId;
    private Integer discountPrice;
    private Integer paymentTypeId;

}
