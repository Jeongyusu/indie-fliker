package com.tenco.indiepicter.reservation;

import java.util.List;

import com.tenco.indiepicter.reservation.response.OffReservationTicketDTO;
import com.tenco.indiepicter.reservation.response.OnReservationTicketDTO;
import com.tenco.indiepicter.reservation.response.ReservationIdDTO;
import org.apache.ibatis.annotations.Mapper;

import com.tenco.indiepicter.reservation.response.VipReservationDTO;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReservationRepository {

	// 예매 등록
	public int insert(Reservation reservation);

	// 예매 삭제
	public int deleteById(@Param("reservationId") Integer reservationId, @Param("principalId") Integer principalId);

	// 예매 번호로 조회
	public Reservation findByReservationCode(String reservationCode);

	// 가장 최근 예매한 예매 번호 조회
	public ReservationIdDTO findByUserIdToReservationId(Integer principalId);

	// 오프라인 예매 티켓 정보 조회
	public OffReservationTicketDTO findByOffReservation(@Param("reservationId") Integer reservationId, @Param("principalId") Integer principalId);

	// 온라인 예매 정보 조회
	public OnReservationTicketDTO findByOnReservation(@Param("reservationId") Integer reservationId, @Param("principalId") Integer principalId);
}
