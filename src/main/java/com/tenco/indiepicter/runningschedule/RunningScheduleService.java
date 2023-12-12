package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter.runningschedule.response.ChoiceDayDTO;
import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import com.tenco.indiepicter.runningschedule.response.SelectDayDTO;
import com.tenco.indiepicter.runningschedule.response.TotalDayDTO;
import com.tenco.indiepicter.seat.SeatRepository;
import com.tenco.indiepicter.theater.TheaterRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class RunningScheduleService {

    @Autowired
    private RunningScheduleRepository runningScheduleRepository;

    @Autowired
    private TheaterRepository theaterRepository;

    @Autowired
    private SeatRepository seatRepository;

    // 선택한 영화의 총 오프라인 상영 기간
    public TotalDayDTO totalDay(Integer movieId) {
        List<RunningSchedule> runningSchedules = runningScheduleRepository.findByMovieId(movieId);
        TotalDayDTO totalDayDTO = new TotalDayDTO(runningSchedules);
        return totalDayDTO;
    }

    // 선택한 날짜 중 상영 일정
    public List<SelectDayDTO> selectDay(Integer movieId, String selectDay){
        List<SelectDayDTO> selectDayDTOs = runningScheduleRepository.findByMovieIdAndRunningDate(movieId, selectDay);

        return selectDayDTOs;
    }

    // 선택한 상영 일정 상세 정보
    public ChoiceDayDTO selectSeat(Integer runningId) {
        ChoiceDayDTO choiceDayDTO = runningScheduleRepository.findByRunningScheduleId(runningId);
        return choiceDayDTO;
    }
}
