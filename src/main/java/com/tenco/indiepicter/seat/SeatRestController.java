package com.tenco.indiepicter.seat;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.seat.request.SaveSeatDTO;
import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api")
public class SeatRestController {

    @Autowired
    private SeatService seatService;

    @Autowired
    private HttpSession session;

    // 오프라인 영화 상영 일정(달력) 선택 API 요청
    @GetMapping("/seat/exist-seat")
    public ResponseEntity<?> existSeat(@RequestParam("runningDateId") Integer runningDateId) {
        List<ExistSeatDTO> existSeatDTOS = seatService.existSeat(runningDateId);
        return ResponseEntity.ok().body(ApiUtils.success(existSeatDTOS));
    }


}
