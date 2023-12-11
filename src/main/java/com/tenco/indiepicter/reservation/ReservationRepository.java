package com.tenco.indiepicter.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationRepository {

	public int findById();
	
}
