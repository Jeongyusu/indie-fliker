package com.tenco.indiepicter.review.vipreview.request;

import lombok.Data;

@Data
public class VipReviewUpdateDTO {
    private Integer vipReviewPoint;
    private String vipReviewContent;
    private Integer vipReviewId;
    private Integer movieId;
}
