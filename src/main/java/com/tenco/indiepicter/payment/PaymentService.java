package com.tenco.indiepicter.payment;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tenco.indiepicter.payment.response.MyPaymentDTO;

@Service
public class PaymentService {

	private PaymentRepository paymentRepository;
	
	public List<MyPaymentDTO> findByOnFundingId(Integer id){
		
		return this.paymentRepository.findByOnFundingId(id);
	}
	
	
}
