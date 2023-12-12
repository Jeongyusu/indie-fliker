package com.tenco.indiepicter.payment;

import com.tenco.indiepicter.theater.Theater;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaymentRepository {

    // 주문 완료 (등록)
    public int insert(Payment Payment);

    // 주문 정보 삭제
    public int deleteById(Integer id);

    // 주문 정보 조회
    public Payment findById(Integer id);

    // 전체 주문 정보 조회
    public List<Payment> findAll();
}
