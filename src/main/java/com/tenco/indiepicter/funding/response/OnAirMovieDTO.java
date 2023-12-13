package com.tenco.indiepicter.funding.response;

import lombok.Data;

@Data
public class OnAirMovieDTO {
    String movieThumbnail;
    String movieName;
    Integer fundingRate;
    String production;
}

