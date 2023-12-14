package com.tenco.indiepicter.scrab.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScrabResponseDTO {
    private Integer fundingId;
    private String thumbnail;
    private Integer targetPrice;
    private Integer presentPrice;
    private String movieName;
    private String synopsis;
    private String production;

}
