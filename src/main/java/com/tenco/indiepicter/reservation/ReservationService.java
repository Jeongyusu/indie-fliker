package com.tenco.indiepicter.reservation;

import java.util.ArrayList;
import java.util.List;

import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.reservation.request.SaveReservationDTO;
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

		List<Seat> seats = seatRepository.findByRunningDateIdAndUserId(lastOrderDTO.getRunningDateId(), 1);
		List<Reservation> reservations = new ArrayList<>();
		for (Seat seat : seats) {
			Reservation reservation = Reservation.builder()
					.reservationCode(lastOrderDTO.getReservationCode())
					.seatId(seat.getId())
					.userId(principalId)
					.build();
			reservations.add(reservation);
		}

		int rowResultCount = 0;
		for (Reservation reservation : reservations) {
			int result = reservationRepository.insert(reservation);
			rowResultCount += result;
		}

		return rowResultCount;
	}

//
}
