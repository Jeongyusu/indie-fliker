package com.tenco.indiepicter.runningschedule.response;

import com.tenco.indiepicter.runningschedule.RunningSchedule;
import lombok.Data;

import java.util.List;

@Data
public class TotalDayDTO {
    private String startRunningDate;
    private String endRunningDate;
    private int movieId;
    private int theaterId;

    public TotalDayDTO(List<RunningSchedule> runningSchedules) {
        this.startRunningDate = runningSchedules.get(0).formatToRunningDate();
        this.endRunningDate = runningSchedules.get(runningSchedules.size()-1).formatToRunningDate();
        this.movieId = runningSchedules.get(0).getMovieId();
        this.theaterId = runningSchedules.get(0).getTheaterId();
    }
}
