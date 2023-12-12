package com.tenco.indiepicter.payment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.payment.response.MyPaymentDTO;
import com.tenco.indiepicter.user.User;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	// 12-12 학원 작업끝
	
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private HttpSession session;
	
	
	// 온라인 결제 내역
	@GetMapping("/on-funding")
	public String onFunding(Model model) {
		
		// 세션에 로그인 정보 저장
//		User principal = (User)session.getAttribute(Define.PRINCIPAL);
//		
//		List<MyPaymentDTO> MyPaymentDTOLists =  this.paymentService.findByOnFundingId(1);
//		
//		model.addAttribute("MyPaymentDTOs", MyPaymentDTOs);
		
		return "mypage/on_payment";
	}
	
	
	// 오프라인 결제 내역
	@GetMapping("/off-funding")
	public String offFunding(Model model) {
		
		// 세션에 로그인 정보 저장
//		User principal = (User)session.getAttribute(Define.PRINCIPAL);
//		
//		List<MyPaymentDTO> MyPaymentDTOLists =  this.paymentService.findByOnFundingId(1);
//		
//		model.addAttribute("MyPaymentDTOs", MyPaymentDTOs);
		
		return "mypage/off_payment";
	}
	
	
}
