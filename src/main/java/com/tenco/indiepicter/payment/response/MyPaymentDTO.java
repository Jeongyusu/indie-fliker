package com.tenco.indiepicter.payment.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyPaymentDTO {

	private String thumbnail;
	private String movieName;
	private Integer presentPrice;
	private String synopsis;
	private Integer finalPrice;
	private Timestamp paymentedAt;
	
}
