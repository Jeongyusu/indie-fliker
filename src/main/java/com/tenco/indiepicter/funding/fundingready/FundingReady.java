package com.tenco.indiepicter.funding.fundingready;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class FundingReady {
    private Integer id;
    private Integer target_price;
    private Integer price_per_onetime;
    private Integer people_count;
    private Timestamp releaseDate;
    private Timestamp endDate;
    private Integer movieId;

    @Builder
    public FundingReady(Integer id, Integer target_price, Integer price_per_onetime, Integer people_count, Timestamp releaseDate, Timestamp endDate, Integer movieId) {
        this.id = id;
        this.target_price = target_price;
        this.price_per_onetime = price_per_onetime;
        this.people_count = people_count;
        this.releaseDate = releaseDate;
        this.endDate = endDate;
        this.movieId = movieId;
    }
}
