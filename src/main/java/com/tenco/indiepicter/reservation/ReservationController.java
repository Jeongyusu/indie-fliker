package com.tenco.indiepicter.reservation;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.reservation.response.VipReservationDTO;
import com.tenco.indiepicter.user.User;

// 작업중 12 - 11 08:00

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/invitation")
	public String reservationTicket(Model model) {
		
//		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
//		List<VipReservationDTO> VipReservationDTOLists = this.reservationService.invitation(1);
//		
//		model.addAttribute("VipReservationDTOLists", VipReservationDTOLists);
		
		return "mypage/invitation";
		
	}
	
    
	

}
