package com.tenco.indiepicter.funding.response;

import lombok.Data;

@Data
public class AdminFundingModifyDTO {
    private String fundingId;
    private String movieId;
    private String movieThumbnail;
    private String movieName;
}
