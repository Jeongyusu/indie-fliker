package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class RunningSchedule {
    private Integer id;
    private Integer runningTime;
    private Timestamp runningDate;
    private Time startTime;
    private Time endTime;
    private Integer movieId;
    private Integer theaterId;

    @Builder
    public RunningSchedule(Integer id, Integer runningTime, Timestamp runningDate, Time startTime, Time endTime, Integer movieId, Integer theaterId) {
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
