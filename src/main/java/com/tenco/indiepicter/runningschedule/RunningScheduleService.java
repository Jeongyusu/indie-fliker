package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter.seat.Seat;
import com.tenco.indiepicter.seat.SeatRepository;
import com.tenco.indiepicter.theater.Theater;
import com.tenco.indiepicter.theater.TheaterRepository;
import com.tenco.indiepicter.user.UserRepository;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service
@Slf4j
public class RunningScheduleService {

    @Autowired
    private RunningScheduleRepository runningScheduleRepository;

    @Autowired
    private TheaterRepository theaterRepository;

    @Autowired
    private SeatRepository seatRepository;

    public RunningScheduleResponse.TotalDayDTO totalDay(Integer movieId) {
        List<RunningSchedule> runningSchedules = runningScheduleRepository.findByMovieId(movieId);
        RunningScheduleResponse.TotalDayDTO responseDto = new RunningScheduleResponse.TotalDayDTO(runningSchedules);
        return responseDto;
    }

    public RunningScheduleResponse.SelectDayDTO selectDay(Integer movieId, String selectDay){
        List<RunningSchedule> runningSchedules = runningScheduleRepository.findByMovieIdAndRunningDate(movieId, selectDay);
        Theater theater = theaterRepository.findById(runningSchedules.get(0).getTheaterId());

    }

}
