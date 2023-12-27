package com.tenco.indiepicter.funding.response;

import lombok.Data;

@Data
public class SearchFundingReadyDTO {
    private Integer fundingReadyId;
    private Integer movieId;
    private String thumbnail;
    private String movieName;
    private String director;
}
