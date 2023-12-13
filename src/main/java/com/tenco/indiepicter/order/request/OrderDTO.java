package com.tenco.indiepicter.order.request;

import lombok.Data;

@Data
public class OrderDTO {
    private Integer movieId;
    private Integer runningDateId;
    private String SelectSeatList;
    private Integer price;
    private Integer count;
}
