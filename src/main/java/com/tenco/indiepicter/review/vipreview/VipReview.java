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
    private Timestamp created_at;
    private Integer point;
    private Integer userId;
    private Integer fundingId;

    @Builder
    public VipReview(Integer id, String content, Timestamp created_at, Integer point, Integer userId, Integer fundingId) {
        this.id = id;
        this.content = content;
        this.created_at = created_at;
        this.point = point;
        this.userId = userId;
        this.fundingId = fundingId;
    }
}
