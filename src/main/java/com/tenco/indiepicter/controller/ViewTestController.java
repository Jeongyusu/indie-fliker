package com.tenco.indiepicter.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewTestController {
    @GetMapping("/online-detail")
    public String onlineDetail(){
        return "fund/onlineDetail";
    }

}
