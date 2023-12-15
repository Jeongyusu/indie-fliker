package com.tenco.indiepicter.order;

import com.tenco.indiepicter.seat.request.SelectSeatDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HttpSession session;

    // 선택한 좌석 및 인원 수 session에 임시저장
    @PostMapping("/{movieId}/session")
    public String orderSessionProc (@PathVariable Integer movieId, SelectSeatDTO selectSeatDTO){
        session.setAttribute("selectSeatDTO", selectSeatDTO);
        return "redirect:/payment/" + selectSeatDTO.getMovieId() +"/off";
    }
}
