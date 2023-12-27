package com.tenco.indiepicter.funding.response;

import lombok.Data;

import java.text.DecimalFormat;
import java.time.LocalDate;

@Data
public class AdminFundingProceedingDTO {
    private Integer fundingId;
    private String movieThumbnail;
    private String movieName;
    private String director;
    private Integer fundingRate;
    private Integer presentPrice;
    private LocalDate endDate;
    private Integer peopleCount;

    public String formatPrice(){
        DecimalFormat df = new DecimalFormat("###,###");
        return df.format(presentPrice);
    }
}
