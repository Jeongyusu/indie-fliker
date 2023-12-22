package com.tenco.indiepicter.order;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.reservation.Reservation;
import com.tenco.indiepicter.reservation.ReservationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ReservationRepository reservationRepository;

    // 오프라인/온라인 예매 주문 정보 등록
    @Transactional
    public int saveOrder(LastOrderDTO requestDTO, Integer principalId) {

        Reservation reservation = reservationRepository.findByReservationCode(requestDTO.getReservationCode());

        if(reservation == null){
            throw new MyDynamicException("예매 내역을 찾을 수 없습니다.",HttpStatus.BAD_REQUEST);
        }

        Order order = Order.builder()
                .selectedSeats(requestDTO.getSeatNames())
                .productPrice(requestDTO.getUnitPrice())
                .quantity(requestDTO.getTotalCount())
                .fundingId(requestDTO.getFundingId())
                .userId(principalId)
                .reservationId(reservation.getId())
                .build();

        return orderRepository.insert(order);
    }

    // 환불로 인한 주문 삭제
    @Transactional
    public int deleteById(Integer orderId, int principalId) {
        return orderRepository.deleteById(orderId, principalId);
    }
}
