package com.tenco.indiepicter.movie.response;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
public class OnlineStreamingDateSettingDTO {

    private Integer id;
    private String movieName;
    private LocalDateTime chatTime;
    private LocalDate onlineReleaseDate;
    private LocalDate onlineEndDate;

}
