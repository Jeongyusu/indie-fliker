package com.tenco.indiepicter.order.request;

import lombok.Data;

@Data
public class OrderDTO {
    private String lastSelectSeatList;
    private Integer price;
    private Integer count;
}
