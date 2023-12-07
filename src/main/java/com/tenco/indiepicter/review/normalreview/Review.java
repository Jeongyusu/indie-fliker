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
    private Timestamp created_at;
    private Integer userId;
    private Integer fundingId;

    @Builder
    public Review(Integer id, String content, Timestamp created_at, Integer userId, Integer fundingId) {
        this.id = id;
        this.content = content;
        this.created_at = created_at;
        this.userId = userId;
        this.fundingId = fundingId;
    }
}
