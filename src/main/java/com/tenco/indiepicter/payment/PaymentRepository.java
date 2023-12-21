package com.tenco.indiepicter.payment;

import com.tenco.indiepicter.theater.Theater;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.tenco.indiepicter.payment.response.MyOfflinePaymentDTO;
import com.tenco.indiepicter.payment.response.MyOnlinePaymentDTO;

@Mapper
public interface PaymentRepository {

  // 주문 완료 (등록)
  public int insert(Payment Payment);

  // 주문 정보 삭제
  public int deleteById(Integer paymentId);

  // 주문 정보 조회
  public Payment findById(Integer id);

  // 전체 주문 정보 조회
  public List<Payment> findAll();


	// 온라인 결제 내역
	public List<MyOnlinePaymentDTO> findByOnlinePaymentId(Integer id); 
	
	// 오프라인 결제 내역
	public List<MyOfflinePaymentDTO> findByOfflinePaymentId(Integer id);
	
}
