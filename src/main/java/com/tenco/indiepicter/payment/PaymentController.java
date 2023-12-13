package com.tenco.indiepicter.payment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.payment.response.MyOfflinePaymentDTO;
import com.tenco.indiepicter.payment.response.MyOnlinePaymentDTO;
import com.tenco.indiepicter.user.User;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private HttpSession session;
	
	
	// 온라인 결제 내역
	@GetMapping("/on-funding")
	public String onFunding(Model model) {
			
		// 세션에 로그인 정보 저장
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		List<MyOnlinePaymentDTO> MyOnlinePaymentDTOLists =  this.paymentService.findByOnlinePaymentId(1);
		
		model.addAttribute("MyOnlinePaymentDTOLists", MyOnlinePaymentDTOLists);
		
		return "mypage/on_payment";
	}
	
	
	// 오프라인 결제 내역
	@GetMapping("/off-funding")
	public String offFunding(Model model) {
		
		// 세션에 로그인 정보 저장
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		List<MyOfflinePaymentDTO> MyOfflinePaymentDTOLists =  this.paymentService.findByOfflinePaymentId(1);
		
		model.addAttribute("MyOfflinePaymentDTOLists", MyOfflinePaymentDTOLists);
		
		return "mypage/off_payment";
	}
	
	
}
