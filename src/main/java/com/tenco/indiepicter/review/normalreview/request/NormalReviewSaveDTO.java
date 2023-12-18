package com.tenco.indiepicter.review.normalreview.request;

import lombok.Data;

@Data
public class NormalReviewSaveDTO {
    private String content;
    private Integer movieId;
}
