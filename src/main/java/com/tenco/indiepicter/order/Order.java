package com.tenco.indiepicter.order;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Order {
    private Integer id;
    private String selectedSeats;
    private Integer productPrice;
    private Integer quantity;
    private Integer fundingId;
    private Integer userId;
    private Integer reservationId;

    @Builder
    public Order(Integer id, String selectedSeats, Integer productPrice, Integer quantity, Integer fundingId, Integer userId, Integer reservationId) {
        this.id = id;
        this.selectedSeats = selectedSeats;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.fundingId = fundingId;
        this.userId = userId;
        this.reservationId = reservationId;
    }
}
