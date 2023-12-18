package com.tenco.indiepicter.review.vipreview;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class VipReview {
    private Integer id;
    private String content;
    private Timestamp createdAt;
    private Integer point;
    private Integer userId;
    private Integer movieId;

    @Builder
    public VipReview(Integer id, String content, Timestamp createdAt, Integer point, Integer userId, Integer movieId) {
        this.id = id;
        this.content = content;
        this.createdAt = createdAt;
        this.point = point;
        this.userId = userId;
        this.movieId = movieId;
    }
}
