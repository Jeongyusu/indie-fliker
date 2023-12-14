package com.tenco.indiepicter.order;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.order.request.SaveOrderDTO;
import com.tenco.indiepicter.seat.request.SelectSeatDTO;
import com.tenco.indiepicter.user.User;
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

    // order 정보 저장
    @PostMapping("/{movieId}/Save")
    public String saveOrderProc(@RequestBody SaveOrderDTO saveOrderDTO){
        // 유저 확인
//        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        System.out.println("디티옹!!!!!!" + saveOrderDTO);
        int rowResultCount = orderService.saveOrder(saveOrderDTO, 1);
        return "redirect:/reservation/"+ saveOrderDTO.getMovieId() +"/off-ticket";
    }


}
