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
        List<RunningSchedule> responseDTOs = runningScheduleRepository.findByMovieId(movieId);
        TotalDayDTO responseDTO = new TotalDayDTO(responseDTOs);
        return responseDTO;
    }

    // 선택한 날짜 중 상영 일정
    public List<SelectDayDTO> selectDay(Integer movieId, String selectDay){
        List<SelectDayDTO> responseDTOs = runningScheduleRepository.findByMovieIdAndRunningDate(movieId, selectDay);

        return responseDTOs;
    }

    // 선택한 상영 일정 상세 정보
    public ChoiceDayDTO selectSeat(Integer runningId) {
        ChoiceDayDTO responseDTO = runningScheduleRepository.findByRunningScheduleId(runningId);
        return responseDTO;
    }
}
