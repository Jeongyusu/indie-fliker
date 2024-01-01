package com.tenco.indiepicter.payment;

import com.tenco.indiepicter.funding.FundingService;
import com.tenco.indiepicter.funding.response.SelectFundingDTO;
import com.tenco.indiepicter.order.OrderService;
import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.payment.request.MyRefundDTO;
import com.tenco.indiepicter.reservation.ReservationService;
import com.tenco.indiepicter.seat.SeatService;
import com.tenco.indiepicter.seat.request.SelectSeatDTO;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleAndPlaceDTO;
import lombok.extern.slf4j.Slf4j;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.payment.response.MyOfflinePaymentDTO;
import com.tenco.indiepicter.payment.response.MyOnlinePaymentDTO;
import com.tenco.indiepicter.user.User;

@Slf4j
@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private SeatService seatService;

	@Autowired
	private FundingService fundingService;

    @Autowired
    private HttpSession session;

	// 온라인 펀딩 결제 내역
	@GetMapping("/on-payment")
	public String onFunding(Model model) {
		// 세션에 로그인 정보 저장
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		if(principal == null) {
			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
		}

		List<MyOnlinePaymentDTO> MyOnlinePaymentDTOS = this.paymentService.findByOnlinePaymentId(principal.getId());
		model.addAttribute("MyOnlinePaymentDTOS", MyOnlinePaymentDTOS);


		List<MyOnlinePaymentDTO> myOnlinePaymentDTOs =  this.paymentService.findByOnlinePaymentId(principal.getId());
		
		model.addAttribute("myOnlinePaymentDTOs", myOnlinePaymentDTOs);
		

		return "mypage/on_payment";
	}
//---------------------------------------------------------------------------------------------------------------------
	// 오프라인 상영 결제 내역
	@GetMapping("/off-payment")
	public String offFunding(Model model) {
		// 세션에 로그인 정보 저장
		User principal = (User)session.getAttribute(Define.PRINCIPAL);

		if(principal == null) {
			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
		}

		List<MyOfflinePaymentDTO> MyOfflinePaymentDTOs =  this.paymentService.findByOfflinePaymentId(principal.getId());
		model.addAttribute("MyOfflinePaymentDTOs", MyOfflinePaymentDTOs);

		List<MyOfflinePaymentDTO> myOfflinePaymentDTOs =  this.paymentService.findByOfflinePaymentId(principal.getId());
		
		model.addAttribute("myOfflinePaymentDTOs", myOfflinePaymentDTOs);
		

		return "mypage/off_payment";
	}
//---------------------------------------------------------------------------------------------------------------------
	// 오프라인 결제 페이지 요청(GET)
    @GetMapping("/{movieId}/off")
    public String offPayment(@PathVariable Integer movieId, Model model){
        // 유저 확인
         User principal = (User)session.getAttribute(Define.PRINCIPAL);

        // 좌석 정보 session에서 꺼내기
        SelectSeatDTO selectSeatDTO = (SelectSeatDTO) session.getAttribute("selectSeatDTO");
        if(selectSeatDTO == null){
			throw new MyDynamicException("결제할 금액이 없습니다. 좌석 먼저 선택해 주세요.", HttpStatus.BAD_REQUEST);
		}

		SelectRunningScheduleAndPlaceDTO selectRunningScheduleAndPlaceDTO = paymentService.offPayment(selectSeatDTO);

        model.addAttribute("selectRunningScheduleAndPlaceDTO", selectRunningScheduleAndPlaceDTO);
		model.addAttribute("principal", principal);
		return "payment/off_payment";
    }

	// 온라인 결제 페이지 요청(GET)
	@GetMapping("/{movieId}/on")
	public String onPayment(@PathVariable Integer movieId, Model model){
		// 유저 확인
		User principal = (User)session.getAttribute(Define.PRINCIPAL);

		SelectFundingDTO selectFundingDTO = paymentService.onPayment(movieId);
		model.addAttribute("selectFundingDTO", selectFundingDTO);
		model.addAttribute("principal", principal);
		return "payment/on_payment";
	}


	// 오프라인 결제 정보 저장(POST)
	// seat, order, reservation, payment => post
	@PostMapping("/{movieId}/off-save")
	public String offPaymentProc(@RequestBody LastOrderDTO lastOrderDTO){
		// 유저정보 확인

		 User principal = (User) session.getAttribute(Define.PRINCIPAL);

		int seatResult = seatService.saveSeat(lastOrderDTO, principal.getId());
		int reservationResult = reservationService.saveReservationTicket(lastOrderDTO, principal.getId());
		int orderResult = orderService.saveOrder(lastOrderDTO, principal.getId());
		int paymentResult = paymentService.savePayment(lastOrderDTO);
		int addFundingTarget = fundingService.addFundingTarget(lastOrderDTO);

		return "redirect:/reservation/"+ lastOrderDTO.getMovieId() +"/off-ticket";
	}

	// 온라인 결제 정보 저장(POST)
	// order, reservation, payment => post
	@PostMapping("/{movieId}/on-save")
	public String onPaymentProc(@RequestBody LastOrderDTO lastOrderDTO){
		// 유저정보 확인
		 User principal = (User) session.getAttribute(Define.PRINCIPAL);

		int reservationResult = reservationService.saveReservationTicket(lastOrderDTO, principal.getId());
		int orderResult = orderService.saveOrder(lastOrderDTO, principal.getId());
		int paymentResult = paymentService.savePayment(lastOrderDTO);
		int addFundingTarget = fundingService.addFundingTarget(lastOrderDTO);

		return "redirect:/reservation/"+ lastOrderDTO.getMovieId() +"/on-ticket";
	}
}
