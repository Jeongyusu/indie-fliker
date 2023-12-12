package com.tenco.indiepicter.payment;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tenco.indiepicter.payment.response.MyPaymentDTO;

@Service
public class PaymentService {

	private PaymentRepository paymentRepository;
	
	// 온라인 결제 내역
	public List<MyPaymentDTO> findByOnlinePaymentId(Integer id){
		
		return this.paymentRepository.findByOnlinePaymentId(id);
	}
	
	// 오프라인 결제 내역
	public List<MyPaymentDTO> findByOfflinePaymentId(Integer id){
		
		return this.paymentRepository.findByOfflinePaymentId(id);
	}
	
}
