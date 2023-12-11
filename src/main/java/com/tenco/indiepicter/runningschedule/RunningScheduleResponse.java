package com.tenco.indiepicter.runningschedule;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

public class RunningScheduleResponse {

    @Data
    public static class totalDayDTO {
        private String startRunningDate;
        private String endRunningDate;
        private int movieId;
        private int theaterId;

        public totalDayDTO(List<RunningSchedule> runningSchedules) {
            this.startRunningDate = runningSchedules.get(0).formatToRunningDate();
            this.endRunningDate = runningSchedules.get(runningSchedules.size()-1).formatToRunningDate();
            this.movieId = runningSchedules.get(0).getMovieId();
            this.theaterId = runningSchedules.get(0).getTheaterId();
        }
    }

    @Data
    public static class selectDayDTO{
        private Integer runningDateId;
        private String movieName;
        private String runningDate;
        private List<movieTimeDTO> movieTimes;

        public selectDayDTO(Integer runningDateId, String movieName, String runningDate, List<movieTimeDTO> movieTimes) {
            this.runningDateId = runningDateId;
            this.movieName = movieName;
            this.runningDate = runningDate;
            this.movieTimes = movieTimes;
        }

        @Data
        public static class movieTimeDTO {
            private String startTime;
            private String endTime;
            private Integer existSeatCount; // 예약 완료된 좌석 수
            private Integer theaterSeatCount; // 극장 총 좌석 수
        }

    }
}
