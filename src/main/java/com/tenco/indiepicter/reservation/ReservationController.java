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


@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private HttpSession session;
	
	// 나의 초청권 내역 페이지
	@GetMapping("/invitation")
	public String reservationTicket(Model model) {
		
//		User principal = (User)session.getAttribute(Define.PRINCIPAL);
//		
//		List<VipReservationDTO> VipReservationDTOLists = this.reservationService.invitation(1);
//		
//		model.addAttribute("VipReservationDTOLists", VipReservationDTOLists);
		
		return "mypage/myinvitation";
		
	}
	
   
}
