package com.tenco.indiepicter.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	// 초청권 현황 확인
	public int findById() {
		
		int reservationTicket = this.reservationRepository.findById();
		
		reservationTicket = 1;
		
		log.debug("------------------------------------------------------");
		log.debug("---------------" + reservationTicket + "------------------------");
		log.debug("------------------------------------------------------");
			
		return reservationTicket;
	}
	


}
