package com.tenco.indiepicter.refund.request;

import lombok.Data;

@Data
public class SaveRefundDTO {
    private Integer paymentId;
    private Integer refundPayment; // 가격
}
