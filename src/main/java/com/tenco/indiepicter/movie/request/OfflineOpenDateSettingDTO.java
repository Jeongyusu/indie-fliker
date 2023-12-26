package com.tenco.indiepicter.movie.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class OfflineOpenDateSettingDTO {
    private Integer id;
    private LocalDate offlineReleaseDate;
    private LocalDate offlineEndDate;
}
