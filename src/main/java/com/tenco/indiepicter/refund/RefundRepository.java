package com.tenco.indiepicter.refund;

import com.tenco.indiepicter.payment.Payment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RefundRepository {

    // 주문 완료 (등록)
    public int insert(Refund refund);
}
