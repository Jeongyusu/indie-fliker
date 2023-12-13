package com.tenco.indiepicter.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.indiepicter.reservation.response.VipReservationDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	public List<VipReservationDTO> invitation(Integer id){
		
		return this.reservationRepository.findByUserId(id);
		
	}
	
}
