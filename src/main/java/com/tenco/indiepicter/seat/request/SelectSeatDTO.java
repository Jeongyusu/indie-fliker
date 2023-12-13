package com.tenco.indiepicter.seat.request;

import lombok.Data;

@Data
public class SelectSeatDTO {
    private Integer movieId;
    private Integer runningDateId;
    private String selectSeats;
    private Integer price;
    private Integer count;
}
