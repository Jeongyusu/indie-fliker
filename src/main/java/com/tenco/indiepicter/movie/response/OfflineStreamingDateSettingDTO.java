package com.tenco.indiepicter.movie.response;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
public class OfflineStreamingDateSettingDTO {

    private Integer id;
    private String movieName;
    private LocalDate offlineReleaseDate;
    private LocalDate offlineEndDate;
    private LocalDate endDate;

}
