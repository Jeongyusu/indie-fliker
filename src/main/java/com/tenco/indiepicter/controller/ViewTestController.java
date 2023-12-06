package com.tenco.indiepicter.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewTestController {
    @GetMapping("/online-detail")
    public String onlineDetail(){
        return "fund/on_detail";
    }


    @GetMapping("/offline-detail")
    public String offlineDetail(){
        return "fund/off_detail";
    }

    @GetMapping("/off-payment")
    public String offPayment(){
        return "reservation/off_payment";
    }

    @GetMapping("/select-day")
    public String selectDay(){
        return "reservation/select_day";
    }
}
