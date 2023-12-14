package com.tenco.indiepicter.order.request;

import lombok.Data;

@Data
public class SaveOrderDTO {
    private Integer movieId;
    private String seatNames;
    private Integer unitPrice; // 단일 가격
    private Integer totalCount;
    private Integer fundingId;
    private Integer userId;
}
