package com.tenco.indiepicter.payment.response;

import java.sql.Timestamp;

import com.tenco.indiepicter._core.utils.BalanceUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import lombok.Data;

@Data
public class MyOnlinePaymentDTO {

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
	private Integer orderId;
	private Integer paymentId;
	private Timestamp paymentedAt;

	// 달성률 계산 및 정수 값 포맷
	public String formatToPercent(){
		return BalanceUtil.calculateAndSetAchievementRate(targetPrice, presentPrice);
	}

	// 결제 시간
	public String formatToDate(){
		return TimeStampUtil.timeStampToString(paymentedAt);
	}

	// 금액 천 단위로
	public String formatToPrice(){
		return BalanceUtil.formatBalance(finalPrice);
	}
}