package com.tenco.indiepicter.funding.fundingready;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDate;

@Getter
@NoArgsConstructor
public class FundingReady {
    private Integer id;
    private Integer targetPrice;
    private Integer presentPrice;
    private Integer pricePerOnetime;
    private Integer peopleCount;
    private LocalDate releaseDate;
    private LocalDate endDate;
    private Integer movieId;

    @Builder
    public FundingReady(Integer id, Integer targetPrice, Integer presentPrice, Integer pricePerOnetime, Integer peopleCount, LocalDate releaseDate, LocalDate endDate, Integer movieId) {
        this.id = id;
        this.targetPrice = targetPrice;
        this.presentPrice = presentPrice;
        this.pricePerOnetime = pricePerOnetime;
        this.peopleCount = peopleCount;
        this.releaseDate = releaseDate;
        this.endDate = endDate;
        this.movieId = movieId;
    }
}
