package com.tenco.indiepicter.runningschedule;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api")
public class RunningScheduleRestController {

    @Autowired
    private RunningScheduleService runningScheduleService;

    // 오프라인 영화 상영 일정(달력) 선택 API 요청
    @GetMapping("/runningschedule/total-day/select-day")
    public ResponseEntity<?> selectDay(@RequestParam("movieId") Integer movieId, @RequestParam("selectDay") String selectDay) {
        List<SelectRunningScheduleDTO> responseDTOs = runningScheduleService.selectDay(movieId,selectDay);
        return ResponseEntity.ok().body(ApiUtils.success(responseDTOs));
    }

}
