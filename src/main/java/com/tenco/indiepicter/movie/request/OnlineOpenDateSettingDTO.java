package com.tenco.indiepicter.movie.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class OnlineOpenDateSettingDTO {
    private Integer id;
    private LocalDate onlineReleaseDate;
    private LocalDate onlineEndDate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime chatTime;

}
