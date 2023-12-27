package com.tenco.indiepicter.funding.response;

import lombok.Data;

import java.time.LocalDate;

@Data
public class AdminOnlineStreamingSearchDTO {
    private String movieId;
    private String thumbnail;
    private String movieName;
    private LocalDate endDate;

}
