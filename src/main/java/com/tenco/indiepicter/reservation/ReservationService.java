package com.tenco.indiepicter.reservation;

import java.util.List;

import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.reservation.response.OffReservationTicketDTO;
import com.tenco.indiepicter.reservation.response.OnReservationTicketDTO;
import com.tenco.indiepicter.reservation.response.ReservationIdDTO;
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


	// 영화 예매 내역 등록
	@Transactional
	public int saveReservationTicket(LastOrderDTO requestDTO, Integer principalId) {
		// 온라인 영화 예매 시 seats id는 없으므로 디폴트 null 처리
		Integer seatsNumber = null;

		Seat seats = seatRepository.findByRunningDateIdAndUserId(requestDTO.getRunningDateId(), principalId);

		if(seats != null){
			seatsNumber = seats.getId();
		}

		Reservation reservation = Reservation.builder()
					.reservationCode(requestDTO.getReservationCode())
					.seatId(seatsNumber)
					.userId(principalId)
					.build();

		return reservationRepository.insert(reservation);
	}

	// 오프라인 예매 내역 조회
	public OffReservationTicketDTO offReservationTicket(Integer reservationId, Integer principalId) {
		OffReservationTicketDTO responseDTO = reservationRepository.findByOffReservation(reservationId, principalId);

		String[] seats = responseDTO.getSeats().split(",");
		int seatCount = seats.length;
		responseDTO.setAudience(seatCount);

		return responseDTO;
	}

	// 온라인 예매 내역 조회
	public OnReservationTicketDTO onReservationTicket(Integer reservationId, Integer principalId) {
		OnReservationTicketDTO responseDTO = reservationRepository.findByOnReservation(reservationId, principalId);
		return responseDTO;
	}

	// 가장 최근에 예매한 예매 번호 조회
	public ReservationIdDTO selectReservationId(Integer principalId) {
		ReservationIdDTO responseDTO = reservationRepository.findByUserIdToReservationId(principalId);
		return responseDTO;
	}

	// 환불 후 예매 내역에서 삭제
	@Transactional
    public int deleteById(Integer reservationId, int principalId) {
		return reservationRepository.deleteById(reservationId, principalId);
    }
}
