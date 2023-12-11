package com.tenco.indiepicter.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	
	@Autowired
	public ReservationService reservationService;
	
	// localhost/reservation/reservationTicket
	@GetMapping("/re")
	public String reservationTicket() {
		return "reservation/reservation_ticket";
	}
	
	
	// jsp 파일 테스트 중
}
