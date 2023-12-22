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

	
	// 온라인 결제 내역
	@GetMapping("/on-funding")
	public String onFunding(Model model) {
			
		// 세션에 로그인 정보 저장
//		User principal = (User)session.getAttribute(Define.PRINCIPAL);
//
//		if(principal == null) {
//			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
//		}
		
		List<MyOnlinePaymentDTO> MyOnlinePaymentDTOs =  this.paymentService.findByOnlinePaymentId(1);
		
		model.addAttribute("MyOnlinePaymentDTOs", MyOnlinePaymentDTOs);
		
		return "mypage/on_payment";
	}
	
	
	// 오프라인 결제 내역
	@GetMapping("/off-funding")
	public String offFunding(Model model) {
		
		// 세션에 로그인 정보 저장
//		User principal = (User)session.getAttribute(Define.PRINCIPAL);
//
//		if(principal == null) {
//			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
//		}
//
		List<MyOfflinePaymentDTO> MyOfflinePaymentDTOs =  this.paymentService.findByOfflinePaymentId(1);
		
		model.addAttribute("MyOfflinePaymentDTOs", MyOfflinePaymentDTOs);
		
		return "mypage/off_payment";
	}
	
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

		SelectFundingDTO selectFundingDTO = paymentService.onPayment(1);
		model.addAttribute("selectFundingDTO", selectFundingDTO);
		model.addAttribute("principal", principal);
		return "payment/on_payment";
	}


	// 오프라인 결제 정보 저장(POST)
	// seat, order, reservation, payment => post
	@PostMapping("/{movieId}/off-save")
	public String offPaymentProc(@RequestBody LastOrderDTO lastOrderDTO){
		// 유저정보 확인
		// User principal = (User) session.getAttribute(Define.PRINCIPAL);

		int seatResult = seatService.saveSeat(lastOrderDTO, 1);
		int reservationResult = reservationService.saveReservationTicket(lastOrderDTO, 1);
		int orderResult = orderService.saveOrder(lastOrderDTO, 1);
		int paymentResult = paymentService.savePayment(lastOrderDTO);
		int addFundingTarget = fundingService.addFundingTarget(lastOrderDTO);
		System.out.println("저장됨!!!!!!!!!!!!" + addFundingTarget);

		return "redirect:/reservation/"+ lastOrderDTO.getMovieId() +"/off-ticket";
	}

	// 온라인 결제 정보 저장(POST)
	// order, reservation, payment => post
	@PostMapping("/{movieId}/on-save")
	public String onPaymentProc(@RequestBody LastOrderDTO lastOrderDTO){
		// 유저정보 확인
		// User principal = (User) session.getAttribute(Define.PRINCIPAL);

		int reservationResult = reservationService.saveReservationTicket(lastOrderDTO, 1);
		int orderResult = orderService.saveOrder(lastOrderDTO, 1);
		int paymentResult = paymentService.savePayment(lastOrderDTO);
		int addFundingTarget = fundingService.addFundingTarget(lastOrderDTO);
		System.out.println("저장됨!!!!!!!!!!!!" + addFundingTarget);

		return "redirect:/reservation/"+ lastOrderDTO.getMovieId() +"/on-ticket";
	}


	// 온라인 결제 정보 삭제(POST)
	@PostMapping("/{movieId}/on-delete")
	public String onPaymentDeleteProc(@RequestBody MyRefundDTO myRefundDTO){

		// 유저정보 확인
		// User principal = (User) session.getAttribute(Define.PRINCIPAL);

		int deleteToPayment = paymentService.deleteById(myRefundDTO.getPaymentId());
		int deleteToOrder = orderService.deleteById(myRefundDTO.getOrderId(), 1);
		int deleteToReservation = reservationService.deleteById(myRefundDTO.getReservationId(), 1);

		return "redirect:/payment/on-funding";
	}
}
