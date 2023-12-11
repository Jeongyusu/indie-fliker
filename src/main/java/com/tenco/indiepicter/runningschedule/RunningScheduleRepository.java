package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter.movie.Movie;
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

    // 특정 영화와 특정 날짜의 오프라인 상영 일정 조회
    public List<RunningSchedule> findByMovieIdAndRunningDate(@Param("movieId") Integer movieId, @Param("runningDate") String runningDate);

    // 특정 영화의 오프라인 상영 일정 기간 조회
    public List<RunningSchedule> findByMovieId(Integer movieId);

    // 오프라인 상영 일정 전체 조회
    public List<RunningSchedule> findAll();

}
