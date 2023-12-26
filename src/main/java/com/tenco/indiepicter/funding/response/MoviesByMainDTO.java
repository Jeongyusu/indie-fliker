package com.tenco.indiepicter.funding.response;

import lombok.Data;

@Data
public class MoviesByMainDTO {
    Integer fundingId;
    Integer movieId;
    String movieThumbnail;
    Long fundingRate;
    String movieName;
    String synopsis;
    String  production;
}