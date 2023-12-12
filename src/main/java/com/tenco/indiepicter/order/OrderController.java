package com.tenco.indiepicter.order;

import com.tenco.indiepicter.order.request.OrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/plus")
    public String orderProc (OrderDTO orderDTO){
        orderService.order(orderDTO);
        return "redirect:/funding-plus";
    }
}
