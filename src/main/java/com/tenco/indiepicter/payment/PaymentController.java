package com.tenco.indiepicter.payment;

import com.tenco.indiepicter.order.request.OrderDTO;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleAndPlaceDTO;
import lombok.extern.slf4j.Slf4j;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
      // 오프라인 결제 화면 요청(GET)
    @GetMapping("/{movieId}/off")
    public String offPayment(@PathVariable Integer movieId, Model model){
        // 유저 확인
        // User principal = (User)session.getAttribute(Define.PRINCIPAL);

        // 좌석 정보 session에서 꺼내기
        OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");
        System.out.println("디티오에서 꺼내기 " + orderDTO);

        SelectRunningScheduleAndPlaceDTO selectDTO = paymentService.offPayment(orderDTO);
        model.addAttribute("selectDTO", selectDTO);
        System.out.println("selectDTO 꺼내기 " + selectDTO.toString());

        return "payment/off_payment";
    }


	// 아임포트 토큰 발행
	
}
