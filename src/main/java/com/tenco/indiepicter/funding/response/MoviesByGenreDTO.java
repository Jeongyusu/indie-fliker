package com.tenco.indiepicter.funding.response;

import lombok.Data;

@Data
public class MoviesByGenreDTO {
    Integer movieId;
    String movieThumbnail;
    Long fundingRate;
    String movieName;
    String synopsis;
    String  production;
}