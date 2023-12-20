package com.tenco.indiepicter.review.vipreview.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VipReviewsToMovieDTO {
    private Integer vipReviewId;
    private Integer vipReviewPoint;
    private String vipReviewContent;
    private Integer userId;
    private String userPic;
    private String username;
}
