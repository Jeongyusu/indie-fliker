package com.tenco.indiepicter.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewTestController {


    @GetMapping("/login")
    public String login() {
        return "user/login";
    }
    @GetMapping("/user-profile")
    public String profile() {
        return "user/profile";
    }

    @GetMapping("/ask")
    public String ask() {
        return "manager/ask";
    }

    @GetMapping("/join")
    public String join() {
        return "user/join";
    }

    @GetMapping("/fund-upload")
    public String fundUpload() {
        return "fund/fund_upload";
    }

    @GetMapping("/online-detail")
    public String onlineDetail() {
        return "fund/on_detail";
    }

    @GetMapping("/offline-detail")
    public String offlineDetail() {
        return "fund/off_detail";
    }

    @GetMapping("/off-payment")
    public String offPayment() {
        return "reservation/off_payment";
    }

    @GetMapping("/select-day")
    public String selectDay() {
        return "reservation/select_day";
    }

    @GetMapping("/on-payment")
    public String onPayment() {
        return "reservation/on_payment";
    }

    @GetMapping("/reservation-ticket")
    public String reservationTicket() {
        return "reservation/reservation_ticket";
    }

    @GetMapping("/select-seat")
    public String selectSeat() {
        return "reservation/select_seat";
    }


    @GetMapping("/main")
    public String main() {
        return "main/main";
    }

    @GetMapping("/movielist")
    public String movielist() {
        return "main/movielist";
    }

    @GetMapping("/online-watch")
    public String onlineWatch() {
        return "main/on_watch";
    }

    @GetMapping("/chatroom")
    public String chatroom() {
        return "main/chatroom";
    }

    @GetMapping("/live-chatrooms")
    public String liveChatrooms() {
        return "main/live_chatrooms";
    }

    @GetMapping("/my-likelist")
    public String likelist() {
        return "mypage/likelist";
    }

    @GetMapping("/offline-funding")
    public String offlineFunding() {
        return "mypage/off_funding";
    }

    @GetMapping("/online-funding")
    public String onlineFunding() {
        return "mypage/on_funding";
    }

}
