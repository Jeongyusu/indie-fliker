package com.tenco.indiepicter.chat.response;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class OpenMovieChatDTO {

    private Integer fundingId;
    private Integer movieId;
    private String movieName;
    private String thumbnail;
    private String director;
    private String genre;
    private String runningGrade;
    private Date onlineReleaseDate;
    private Timestamp chatTime;
}
