package com.tenco.indiepicter.refund;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Refund {
    private Integer id;
    private Integer refundPayment;
    private Timestamp refundedAt;
    private Integer paymentId;

    @Builder
    public Refund(Integer id, Integer refundPayment, Timestamp refundedAt, Integer paymentId) {
        this.id = id;
        this.refundPayment = refundPayment;
        this.refundedAt = refundedAt;
        this.paymentId = paymentId;
    }
}
