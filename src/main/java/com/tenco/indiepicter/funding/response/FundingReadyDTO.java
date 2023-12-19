package com.tenco.indiepicter.funding.response;

import lombok.Data;

@Data
public class FundingReadyDTO {
    private Integer fundingReadyId;
    private String thumbnail;
    private String movieName;
    private String director;
}
