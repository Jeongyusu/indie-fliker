package com.tenco.indiepicter.payment.request;

import lombok.Data;

@Data
public class MyRefundDTO {

    private Integer reservationId;
    private Integer orderId;
    private Integer paymentId;
}
