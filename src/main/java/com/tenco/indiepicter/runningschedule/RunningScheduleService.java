package com.tenco.indiepicter.runningschedule;

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

    public RunningScheduleResponse.TotalDayDTO totalDay(Integer movieId) {
        List<RunningSchedule> runningSchedules = runningScheduleRepository.findByMovieId(movieId);
        RunningScheduleResponse.TotalDayDTO responseDto = new RunningScheduleResponse.TotalDayDTO(runningSchedules);
        return responseDto;
    }

    public RunningScheduleResponse.SelectDayDTO findByMovieIdAndRunningDate(Integer movieId, String selectDay) {
        RunningScheduleResponse.SelectDayDTO responseDto = runningScheduleRepository.findByMovieIdAndRunningDate(
                movieId,selectDay);
        return responseDto;
    }
}
