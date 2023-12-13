package com.tenco.indiepicter.funding.response;

import lombok.Data;

@Data
public class OnAirMovieRankingDTO {
    String movieThumbnail;
    String movieName;
    Integer fundingRate;
    String production;
}
