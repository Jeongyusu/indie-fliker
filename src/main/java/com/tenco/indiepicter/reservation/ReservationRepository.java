package com.tenco.indiepicter.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.indiepicter.reservation.response.VipReservationDTO;

@Mapper
public interface ReservationRepository {
	
	public List<VipReservationDTO> findByUserId(Integer id);
	
}
