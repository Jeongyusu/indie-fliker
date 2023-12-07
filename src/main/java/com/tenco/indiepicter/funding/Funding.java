package com.tenco.indiepicter.funding;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Funding {
    private Integer id;
    private Integer targetPrice;
    private Integer pricePerOnetime;
    private Integer peopleCount;
    private Timestamp releaseDate;
    private Timestamp endDate;
    private Integer movieId;

    @Builder
    public Funding(Integer id, Integer targetPrice, Integer pricePerOnetime, Integer peopleCount, Timestamp releaseDate, Timestamp endDate, Integer movieId) {
        this.id = id;
        this.targetPrice = targetPrice;
        this.pricePerOnetime = pricePerOnetime;
        this.peopleCount = peopleCount;
        this.releaseDate = releaseDate;
        this.endDate = endDate;
        this.movieId = movieId;
    }
}
