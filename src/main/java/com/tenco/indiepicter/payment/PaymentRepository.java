package com.tenco.indiepicter.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.indiepicter.payment.response.MyOfflinePaymentDTO;
import com.tenco.indiepicter.payment.response.MyOnlinePaymentDTO;

@Mapper
public interface PaymentRepository {
	
	// 온라인 결제 내역
	public List<MyOnlinePaymentDTO> findByOnlinePaymentId(Integer id); 
	
	// 오프라인 결제 내역
	public List<MyOfflinePaymentDTO> findByOfflinePaymentId(Integer id);
	
}
