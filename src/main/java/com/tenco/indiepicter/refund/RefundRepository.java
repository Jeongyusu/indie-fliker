package com.tenco.indiepicter.refund;

import com.tenco.indiepicter.refund.response.FindRefundDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RefundRepository {

    // 환불 완료 (등록)
    public int insert(Refund refund);

    // 환불 조회
    public FindRefundDTO findByPaymentId(Integer paymentId);
}
