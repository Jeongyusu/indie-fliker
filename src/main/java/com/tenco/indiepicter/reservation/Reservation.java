package com.tenco.indiepicter.reservation;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Reservation {
    private Integer id;
    private String reservationCode;
    private Timestamp reservatedAt;
    private Integer userId;
    private Integer seatId;

    @Builder
    public Reservation(Integer id, String reservationCode, Timestamp reservatedAt, Integer userId, Integer seatId) {
        this.id = id;
        this.reservationCode = reservationCode;
        this.reservatedAt = reservatedAt;
        this.userId = userId;
        this.seatId = seatId;
    }
}
