package com.tenco.indiepicter.reservation;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ReservationController {

    @GetMapping("/test-ticket")
    public String reservationTicket(){
        return "reservation/reservation_ticket";
    }

    
}
