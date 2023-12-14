package com.tenco.indiepicter.seat;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.order.request.SaveOrderDTO;
import com.tenco.indiepicter.seat.request.SaveSeatDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/seat")
public class SeatController {

    @Autowired
    private SeatService seatService;

    @Autowired
    private HttpSession session;

    //order 정보 저장
    @PostMapping("/{movieId}/Save")
    public String saveSeatProc(@RequestBody SaveSeatDTO saveSeatDTO){
        // 유저정보 확인
        User principal = (User) session.getAttribute(Define.PRINCIPAL);

        int rowResultCount = seatService.saveSeat(saveSeatDTO, 1);
        return "redirect:/reservation/"+ saveSeatDTO.getMovieId() +"/off-ticket";
    }

}
