package com.tenco.indiepicter.reservation;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.reservation.response.ReservationIdDTO;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@Slf4j
@RequestMapping("/api")
public class ReservationRestController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private HttpSession session;

   // 가장 최근 예매한 예매 번호 조회
    @GetMapping("/reservation")
    public ResponseEntity<?> selectReservationId() {
//        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        ReservationIdDTO responseDTO = reservationService.selectReservationId(1);
        return ResponseEntity.ok().body(ApiUtils.success(responseDTO));
    }}
