package com.tenco.indiepicter.seat.request;

import lombok.Data;

@Data
public class SaveSeatDTO {
    private Integer movieId;
    private String seatNames;
    private Integer runningDateId;
}
