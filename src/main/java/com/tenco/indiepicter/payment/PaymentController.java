package com.tenco.indiepicter.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.user.User;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private HttpSession session;
	
	
	// 온라인 펀딩 결제 내역
	@GetMapping("/on-funding")
	public String onFunding() {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		
		
		return "mypage/on_funding";
	}
	
	// 오프라인 펀딩 결제 내역
	@GetMapping("/off-funding")
	public String offFunding() {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		return "mypage/off_funding";
	}
	
	
}
