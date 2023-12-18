package com.tenco.indiepicter.review.normalreview;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Review {
    private Integer id;
    private String content;
    private Timestamp createdAt;
    private Integer userId;
    private Integer movieId;

    @Builder
    public Review(Integer id, String content, Timestamp createdAt, Integer userId, Integer movieId) {
        this.id = id;
        this.content = content;
        this.createdAt = createdAt;
        this.userId = userId;
        this.movieId = movieId;
    }
}
