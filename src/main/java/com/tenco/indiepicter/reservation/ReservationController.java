package com.tenco.indiepicter.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.reservation.request.SaveReservationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
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
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		if(principal == null) {
			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
		}
		
		List<VipReservationDTO> VipReservationDTOLists = this.reservationService.invitation(principal.getId());
		
		model.addAttribute("VipReservationDTOLists", VipReservationDTOLists);
		
		return "mypage/myinvitation";
		
	}
	
	// 영화 예매 완료 후 티켓 페이지 요청(GET)
	@GetMapping("/{movieId}/off-ticket")
	public String offReservationTicket(){
		return "reservation/reservation_ticket";
	}

}
