package com.tenco.indiepicter.seat;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.runningschedule.RunningScheduleService;
import com.tenco.indiepicter.runningschedule.response.SelectDayDTO;
import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/seat")
public class SeatRestController {

    @Autowired
    private SeatService seatService;

    // 오프라인 영화 상영 일정(달력) 선택 API 요청
    @GetMapping("/api/exist-seat")
    public ResponseEntity<?> existSeat(@RequestParam("runningscheduleId") Integer runningscheduleId) {
        List<ExistSeatDTO> existSeatDTOs = seatService.existSeat(runningscheduleId);
        return ResponseEntity.ok().body(ApiUtils.success(existSeatDTOs));
    }

}
