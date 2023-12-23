package com.tenco.indiepicter.movie.request;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class OnlineOpenDateSettingDTO {
    private LocalDate onlineReleaseDate;
    private LocalDate onlineEndDate;
    private LocalDateTime chatTime;

}
