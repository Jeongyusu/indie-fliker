package com.tenco.indiepicter.payment.response;

import java.sql.Timestamp;

import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

@Data
public class MyOfflinePaymentDTO {

	private String thumbnail;
	private Integer movieId;
	private String movieName;
	private Integer fundingId;
	private Integer presentPrice;
	private Integer targetPrice;
	private String director;
	private String synopsis;
	private Integer finalPrice;
	private Integer reservationId;
	private String reservationCode;
	private Integer paymentId;
	private Timestamp paymentedAt;
	private Integer refundPayment;
	private Timestamp refundedAt;
	private Integer refundPaymentId;

	// 생성자
	public MyOfflinePaymentDTO() {
		if (refundPayment == null) {
			refundPayment = 0;
		}

		if (refundedAt == null) {
			refundedAt = new Timestamp(System.currentTimeMillis());
		}

		if (refundPaymentId == null) {
			refundPaymentId = 0;
		}
	}

	// 달성률 계산 및 정수 값 포맷
	public String formatToPercent(){
		return BalanceUtil.calculateAndSetAchievementRate(targetPrice, presentPrice);
	}

	// 결제 시간
	public String formatToDate(){
		return TimeStampUtil.timeStampToString(paymentedAt);
	}

	// 결제 시간
	public String formatToRefundDate(){
		return TimeStampUtil.timeStampToString(refundedAt);
	}

	// 결제 금액 천 단위로
	public String formatToPrice(){
		return BalanceUtil.formatBalance(finalPrice);
	}

	// 환불 금액 천 단위로
	public String formatToRefundPrice(){
		return BalanceUtil.formatBalance(refundPayment);
	}
}