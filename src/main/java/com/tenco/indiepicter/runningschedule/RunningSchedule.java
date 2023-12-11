package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class RunningSchedule {
    private Integer id;
    private Integer runningTime;
    private Timestamp runningDate;
    private Timestamp startTime;
    private Timestamp endTime;
    private Integer movieId;
    private Integer theaterId;

    @Builder
    public RunningSchedule(Integer id, Integer runningTime, Timestamp runningDate, Timestamp startTime, Timestamp endTime, Integer movieId, Integer theaterId) {
        this.id = id;
        this.runningTime = runningTime;
        this.runningDate = runningDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.movieId = movieId;
        this.theaterId = theaterId;
    }

    // yyyy-MM-dd
    public String formatToRunningDate(){ return TimeStampUtil.timeStampToDate(runningDate);}
}
