package com.tenco.indiepicter.review.normalreview.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NormalReviewsToMovieDTO {
    private Integer normalReviewId;
    private String content;
    private Integer userId;
    private String userPic;
    private String username;
}
