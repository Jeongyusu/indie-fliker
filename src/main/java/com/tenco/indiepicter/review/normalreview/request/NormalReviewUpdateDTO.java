package com.tenco.indiepicter.review.normalreview.request;

import lombok.Data;

@Data
public class NormalReviewUpdateDTO {
    private String content;
    private Integer normalReviewId;
    private Integer movieId;
}
