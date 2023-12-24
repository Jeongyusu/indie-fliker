package com.tenco.indiepicter.funding.response;

import lombok.Data;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Data
public class AdminOnlineStreamingDTO {
    private String movieId;
    private String thumbnail;
    private String movieName;
    private LocalDate endDate;


}
