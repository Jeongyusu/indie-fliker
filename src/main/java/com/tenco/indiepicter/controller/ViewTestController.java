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

    @GetMapping("/on-payment")
    public String onPayment(){
        return "reservation/on_payment";
    }

    @GetMapping("/reservation-ticket")
    public String reservationTicket(){
        return "reservation/reservation_ticket";
    }
    
    
    @GetMapping("/main")
    public String main(){
        return "main/main";
    }
    
    @GetMapping("/movielist")
    public String movielist(){
        return "main/movielist";
    }
    
    @GetMapping("/online-watch")
    public String onlineWatch(){
        return "main/on_watch";
    }
    
    @GetMapping("/chatroom")
    public String chatroom(){
        return "main/chatroom";
    }
    
    @GetMapping("/my-likelist")
    public String likelist(){
        return "mypage/likelist";
    }
    
    @GetMapping("/my-funding-offline")
    public String offlineFunding(){
        return "mypage/offline_funding";
    }
    
    @GetMapping("/my-funding-online")
    public String onlineFunding(){
        return "mypage/online_funding";
    }
    
}
