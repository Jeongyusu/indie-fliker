package com.tenco.indiepicter.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.tenco.indiepicter.reservation.response.OffReservationTicketDTO;
import com.tenco.indiepicter.reservation.response.OnReservationTicketDTO;
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
	
	// 오프라인 영화 예매 완료 후 티켓 페이지 요청(GET)
	@GetMapping("/{movieId}/off-ticket")
	public String offReservationTicket(@RequestParam Integer reservationId, Model model){
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		OffReservationTicketDTO offReservationTicketDTO = reservationService.offReservationTicket(reservationId, 1);
		model.addAttribute("offReservationTicketDTO", offReservationTicketDTO);
		return "reservation/off_reservation_ticket";
	}

	// 온라인 영화 예매 완료 후 티켓 페이지 요청(GET)
	@GetMapping("/{movieId}/on-ticket")
	public String onReservationTicket(@RequestParam Integer reservationId, Model model){
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		OnReservationTicketDTO onReservationTicketDTO = reservationService.onReservationTicket(reservationId, 1);
		model.addAttribute("onReservationTicketDTO", onReservationTicketDTO);
		return "reservation/on_reservation_ticket";
	}

}
