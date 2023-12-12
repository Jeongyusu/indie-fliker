package com.tenco.indiepicter.runningschedule.response;

import lombok.Data;

import java.util.List;

@Data
public class ChoiceDayDTO {
    private Integer runningDateId;
    private String movieName;
    private String runningGrade;
    private String runningDate;
    private Integer movieId;
    private Integer theaterId;
    private String startTime;
    private String endTime;
    private List<ExistSeatDTO> existSeatDTOs;
}
