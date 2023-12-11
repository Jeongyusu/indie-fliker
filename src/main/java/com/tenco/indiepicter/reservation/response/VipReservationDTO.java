package com.tenco.indiepicter.reservation.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VipReservationDTO {

	private String movieName;
	
    private Timestamp runningDate;
    
    private Timestamp startTime;
	
	private String address;
	
	private String seatName;
	
	private String theaterName;
	 
	private String reservationCode;
	
}
