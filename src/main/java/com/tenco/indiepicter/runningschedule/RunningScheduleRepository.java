package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter.runningschedule.response.ChoiceDayDTO;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleAndPlaceDTO;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RunningScheduleRepository {

    // 오프라인 상영 일정 등록
    public void insert(RunningSchedule runningSchedule);

    // 오프라인 상영 일정 수정
    public int updateById(RunningSchedule runningSchedule);

    // 오프라인 상영 일정 삭제
    public int deleteById(Integer id);

    // 선택한 영화와 선택한 날짜의 오프라인 상영 일정 조회
    public List<SelectRunningScheduleDTO> findByMovieIdAndRunningDate(@Param("movieId") Integer movieId, @Param("runningDate") String runningDate);

    // 선택한 오프라인 상영 일정 상세 조회
    public ChoiceDayDTO findByRunningScheduleId(Integer runningScheduleid);

    // 선택한 오프라인 상영 일정 상세 조회 + 영화관 정보
    public SelectRunningScheduleAndPlaceDTO findByRunningScheduleIdAndPlace(Integer runningDateId);

    // 선택한 영화의 오프라인 상영 일정 기간 조회
    public List<RunningSchedule> findByMovieId(Integer movieId);

    // 오프라인 상영 일정 전체 조회
    public List<RunningSchedule> findAll();

}
