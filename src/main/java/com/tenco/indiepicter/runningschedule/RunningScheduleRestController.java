package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter._core.utils.ApiUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/runningschedule")
public class RunningScheduleRestController {

    @Autowired
    private RunningScheduleService runningScheduleService;

    // 오프라인 영화 상영 일정(달력) 선택 API 요청
    @GetMapping("/api/{movieId}/total-day/select-day")
    public ResponseEntity<?> selectDay(@PathVariable Integer movieId, @RequestParam(value = "selectDay") String selectDay) {
        List<RunningSchedule> selectDayDTO = runningScheduleService.findByMovieIdAndRunningDate(movieId,selectDay);
        return ResponseEntity.ok().body(ApiUtils.success(selectDayDTO));
    }

}
