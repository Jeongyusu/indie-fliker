package com.tenco.indiepicter.runningschedule;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

public class RunningScheduleResponse {

    @Data
    public static class TotalDayDTO {
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

    @Data
    public static class SelectDayDTO{
        private Integer runningDateId;
        private String movieName;
        private String runningGrade;
        private String runningDate;
        private List<MovieTimeDTO> movieTimes;

        @Data
        public static class MovieTimeDTO {
            private String startTime;
            private String endTime;
            private Integer existSeatCount; // 예약 완료된 좌석 수
            private Integer theaterSeatCount; // 극장 총 좌석 수
        }

    }
}
