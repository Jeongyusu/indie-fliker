package com.tenco.indiepicter.refund;

import com.tenco.indiepicter.refund.request.SaveRefundDTO;
import com.tenco.indiepicter.refund.response.FindRefundDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class RefundService {

    @Autowired
    private RefundRepository refundRepository;

    @Transactional
    public int saveRefund(SaveRefundDTO requestDTO) {
        Refund refund = Refund.builder()
                .refundPayment(requestDTO.getRefundPayment())
                .paymentId(requestDTO.getPaymentId())
                .build();
        return refundRepository.insert(refund);
    }

    public FindRefundDTO findRefund(Integer paymentId) {
        return refundRepository.findByPaymentId(paymentId);
    }
}
