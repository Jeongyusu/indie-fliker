package com.tenco.indiepicter.order;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.order.request.OrderDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HttpSession session;

    @PostMapping("/plus")
    public String orderProc (OrderDTO orderDTO){
        // 유저 확인
        // User principal = (User)session.getAttribute(Define.PRINCIPAL);

        // 핵심기능 - order
        orderService.order(orderDTO, 1);
        return "redirect:/funding-plus";
    }
}
