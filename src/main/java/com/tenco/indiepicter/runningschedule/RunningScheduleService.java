package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter.runningschedule.response.SelectDayDTO;
import com.tenco.indiepicter.runningschedule.response.TotalDayDTO;
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

    // 특정 영화 총 오프라인 상영 기간
    public TotalDayDTO totalDay(Integer movieId) {
        List<RunningSchedule> runningSchedules = runningScheduleRepository.findByMovieId(movieId);
        TotalDayDTO responseDTO = new TotalDayDTO(runningSchedules);
        System.out.println("날짜 : " + responseDTO.toString());
        return responseDTO;
    }

    // 특정 날짜 중 상영 일정
    public List<SelectDayDTO> selectDay(Integer movieId, String selectDay){
        List<SelectDayDTO> selectDayDTOs = runningScheduleRepository.findByMovieIdAndRunningDate(movieId, selectDay);
        return selectDayDTOs;
    }

}
