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

    public RunningScheduleResponse.totalDayDTO totalDay(Integer movieId) {
        List<RunningSchedule> runningSchedules = runningScheduleRepository.findByMovieId(movieId);
        RunningScheduleResponse.totalDayDTO responseDto = new RunningScheduleResponse.totalDayDTO(runningSchedules);
        return responseDto;
    }

    public List<RunningSchedule> findByMovieIdAndRunningDate(Integer movieId, String selectDay) {
       List<RunningSchedule> responseDto = runningScheduleRepository.findByMovieIdAndRunningDate(
                movieId,selectDay);
        return responseDto;
    }
}
