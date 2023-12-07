package com.tenco.indiepicter.payment.paymenttype;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class PaymentType {
    private Integer id;
    private String type;

    @Builder
    public PaymentType(Integer id, String type) {
        this.id = id;
        this.type = type;
    }
}
