package com.tenco.indiepicter.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.indiepicter.payment.response.MyPaymentDTO;

@Mapper
public interface PaymentRepository {

	public List<MyPaymentDTO> findByOnFundingId(Integer id); 
	
	public List<MyPaymentDTO> findByOffFundingId();
	
}
