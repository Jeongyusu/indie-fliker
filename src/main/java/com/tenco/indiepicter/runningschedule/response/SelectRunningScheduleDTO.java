package com.tenco.indiepicter.runningschedule.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SelectRunningScheduleDTO{
    private Integer runningDateId;
    private String movieName;
    private String runningGrade;
    private String runningDate;
    private Integer movieId;
    private Integer theaterId;
    private String startTime;
    private String endTime;
    private Integer existSeatCount; // 예약 완료된 좌석 수
    private Integer theaterSeatCount; // 극장 총 좌석 수
}
