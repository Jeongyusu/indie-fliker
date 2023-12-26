package com.tenco.indiepicter.movie.request;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UpdateOnlineDateDTO {

    private Timestamp onlineReleaseDate;
    private Timestamp onlineEndDate;
    private Timestamp chatTime;
    private Integer movieId;
}
