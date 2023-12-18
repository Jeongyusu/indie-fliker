package com.tenco.indiepicter.funding.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
public class SearchResultDTO {
    private Integer fundingId;
    private String thumbnail;
    private Integer fundingRate;
    private String movieName;
    private String synopsis;
    private String production;
}
