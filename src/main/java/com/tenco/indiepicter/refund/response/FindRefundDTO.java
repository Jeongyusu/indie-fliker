package com.tenco.indiepicter.refund.response;

import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class FindRefundDTO {
    private Integer refundPayment;
    private Timestamp refundedAt;
    private Integer paymentId;

    // 결제 시간
    public String formatToDate(){
        return TimeStampUtil.timeStampToString(refundedAt);
    }

    // 금액 천 단위로
    public String formatToPrice(){
        return BalanceUtil.formatBalance(refundPayment);
    }
}
