package com.tenco.indiepicter.payment.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyOfflinePaymentDTO {
	
	private String thumbnail;
	private String movieName;
	private Integer presentPrice;
	private Integer targetPrice;
	private String synopsis;
	private Integer finalPrice;
	private Timestamp paymentedAt;

}
