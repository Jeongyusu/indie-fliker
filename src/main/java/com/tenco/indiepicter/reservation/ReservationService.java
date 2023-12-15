package com.tenco.indiepicter.reservation;

import java.util.ArrayList;
import java.util.List;

import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.reservation.response.ReservationIdDTO;
import com.tenco.indiepicter.reservation.response.ReservationTicketDTO;
import com.tenco.indiepicter.seat.Seat;
import com.tenco.indiepicter.seat.SeatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.indiepicter.reservation.response.VipReservationDTO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	@Autowired
	private SeatRepository seatRepository;


	public List<VipReservationDTO> invitation(Integer id){
		return this.reservationRepository.findByUserId(id);
	}

	// 오프라인 영화 예매 티켓 등록
	@Transactional
	public int saveReservationTicket(LastOrderDTO lastOrderDTO, Integer principalId) {

		Seat seats = seatRepository.findByRunningDateIdAndUserId(lastOrderDTO.getRunningDateId(), 1);
		Reservation reservation = Reservation.builder()
					.reservationCode(lastOrderDTO.getReservationCode())
					.seatId(seats.getId())
					.userId(principalId)
					.build();

		return reservationRepository.insert(reservation);
	}

	// 오프라인 예매 티켓 조회
	public ReservationTicketDTO offReservationTicket(Integer reservationId, Integer principalId) {
		ReservationTicketDTO responseDTO = reservationRepository.findByReservation(reservationId, principalId);

		String[] seats = responseDTO.getSeats().split(",");
		int seatCount = seats.length;
		responseDTO.setAudience(seatCount);

		return responseDTO;
	}

	// 가장 최근에 예매한 예매 번호 조회
	public ReservationIdDTO selectReservationId(Integer principalId) {
		ReservationIdDTO responseDTO = reservationRepository.findByUserIdToReservationId(principalId);
		return responseDTO;
	}


}
