package com.tenco.indiepicter.review.vipreview.request;

import lombok.Data;

@Data
public class VipReviewSaveDTO {
    private String vipReviewContent;
    private Integer vipReviewPoint;
    private Integer movieId;
}
