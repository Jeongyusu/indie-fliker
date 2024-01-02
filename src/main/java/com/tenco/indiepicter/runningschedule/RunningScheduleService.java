package com.tenco.indiepicter.runningschedule;

import ch.qos.logback.core.util.TimeUtil;
import com.tenco.indiepicter._core.handler.exception.MyPageException;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter.runningschedule.response.ChoiceDayDTO;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleDTO;
import com.tenco.indiepicter.runningschedule.response.TotalDayDTO;
import com.tenco.indiepicter.seat.SeatRepository;
import com.tenco.indiepicter.theater.TheaterRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
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
        return new TotalDayDTO(responseDTOs);
    }

    // 선택한 날짜 중 상영 일정
    public List<SelectRunningScheduleDTO> selectDay(Integer movieId, String selectDay){
        return runningScheduleRepository.findByMovieIdAndRunningDate(movieId, selectDay);
    }

    // 선택한 상영 일정 상세 정보
    public ChoiceDayDTO selectSeat(Integer runningId) {
        return runningScheduleRepository.findByRunningScheduleId(runningId);
    }
    // 영화 스케쥴 더미데이터 생성
    public void insertRunningSchedule(){

    for(int i=11; i<51; i++) {
        RunningSchedule runningSchedule = RunningSchedule.builder()
                .runningTime(90)
                .runningDate(TimeStampUtil.StringToTimestamp("2023-01-20 00:00:00"))
                .startTime(TimeStampUtil.StringToTime("13:00:00"))
                .endTime(TimeStampUtil.StringToTime("14:30:00"))
                .movieId(i)
                .theaterId(1)
                .build();
        try {
            runningScheduleRepository.insert(runningSchedule);
        }catch(Exception e) {
            throw new MyPageException("runningSchedule_tb 더미 삽입실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    for(int i=51; i<91; i++){
        RunningSchedule runningSchedule = RunningSchedule.builder()
                .runningTime(120)
                .runningDate(TimeStampUtil.StringToTimestamp("2023-01-30 00:00:00"))
                .startTime(TimeStampUtil.StringToTime("15:00:00"))
                .endTime(TimeStampUtil.StringToTime("17:00:00"))
                .movieId(i)
                .theaterId(2)
                .build();
        try {
            runningScheduleRepository.insert(runningSchedule);
        }catch(Exception e) {
            throw new MyPageException("runningSchedule_tb 더미 삽입실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

//        for(int i=91; i<121; i++) {
//            RunningSchedule runningSchedule = RunningSchedule.builder()
//                    .runningTime(150)
//                    .runningDate(TimeStampUtil.StringToTimestamp("2023-02-24 00:00:00"))
//                    .startTime(TimeStampUtil.StringToTime("16:00:00"))
//                    .endTime(TimeStampUtil.StringToTime("18:30:00"))
//                    .movieId(i)
//                    .theaterId(3)
//                    .build();
//            try {
//                runningScheduleRepository.insert(runningSchedule);
//            }catch(Exception e) {
//                throw new MyPageException("runningSchedule_tb 더미 삽입실패", HttpStatus.INTERNAL_SERVER_ERROR);
//            }
//        }
//
//        for(int i=121; i<151; i++) {
//            RunningSchedule runningSchedule = RunningSchedule.builder()
//                    .runningTime(90)
//                    .runningDate(TimeStampUtil.StringToTimestamp("2023-01-10 00:00:00"))
//                    .startTime(TimeStampUtil.StringToTime("11:00:00"))
//                    .endTime(TimeStampUtil.StringToTime("12:30:00"))
//                    .movieId(i)
//                    .theaterId(4)
//                    .build();
//            try {
//                runningScheduleRepository.insert(runningSchedule);
//            }catch(Exception e) {
//                throw new MyPageException("runningSchedule_tb 더미 삽입실패", HttpStatus.INTERNAL_SERVER_ERROR);
//            }
//        }
//
//
//        for(int i=151; i<181; i++) {
//            RunningSchedule runningSchedule = RunningSchedule.builder()
//                    .runningTime(120)
//                    .runningDate(TimeStampUtil.StringToTimestamp("2023-02-20 00:00:00"))
//                    .startTime(TimeStampUtil.StringToTime("19:00:00"))
//                    .endTime(TimeStampUtil.StringToTime("21:00:00"))
//                    .movieId(i)
//                    .theaterId(5)
//                    .build();
//            try {
//                runningScheduleRepository.insert(runningSchedule);
//            }catch(Exception e) {
//                throw new MyPageException("runningSchedule_tb 더미 삽입실패", HttpStatus.INTERNAL_SERVER_ERROR);
//            }
//        }


    }


}
