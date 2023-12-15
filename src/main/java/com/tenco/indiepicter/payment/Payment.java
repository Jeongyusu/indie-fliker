package com.tenco.indiepicter.payment;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Payment {
    private Integer id;
    private Integer totalPrice;
    private Integer discountPrice;
    private Integer finalPrice;
    private Timestamp paymentedAt;
    private Integer paymentTypeId;
    private Integer orderId;

    @Builder
    public Payment(Integer id, Integer totalPrice, Integer discountPrice, Integer finalPrice, Timestamp paymentedAt, Integer paymentTypeId, Integer orderId) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.discountPrice = discountPrice;
        this.finalPrice = finalPrice;
        this.paymentedAt = paymentedAt;
        this.paymentTypeId = paymentTypeId;
        this.orderId = orderId;
    }
}
