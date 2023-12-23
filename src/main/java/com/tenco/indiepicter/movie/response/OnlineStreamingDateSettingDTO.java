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

    public String chatTimeConvert(){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 M월 d일 a h:mm");
        return chatTime.format(formatter);
    }
}
