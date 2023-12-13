package com.tenco.indiepicter.order.response;

import lombok.Data;

@Data
public class TotalCountAndPaymentDTO {
    private Integer totalQuantity;
    private Integer totalPrice;
    private Integer fundingId;
}
