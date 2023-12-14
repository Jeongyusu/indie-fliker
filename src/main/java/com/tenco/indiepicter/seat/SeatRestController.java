package com.tenco.indiepicter.seat;

import com.tenco.indiepicter._core.utils.ApiUtils;
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
    public ResponseEntity<?> existSeat(@RequestParam("runningDateId") Integer runningDateId) {
        List<ExistSeatDTO> existSeatDTOS = seatService.existSeat(runningDateId);
        return ResponseEntity.ok().body(ApiUtils.success(existSeatDTOS));
    }

}
