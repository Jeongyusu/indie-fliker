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

    // 오프라인 주문 정보 등록
    @Transactional
    public int saveOrder(LastOrderDTO lastOrderDTO, Integer principalId) {

        Reservation reservation = reservationRepository.findByReservationCode(lastOrderDTO.getReservationCode());

        if(reservation == null){
            throw new MyDynamicException("예매 내역을 찾을 수 없습니다.",HttpStatus.BAD_REQUEST);
        }

        Order order = Order.builder()
                .selectedSeats(lastOrderDTO.getSeatNames())
                .productPrice(lastOrderDTO.getUnitPrice())
                .quantity(lastOrderDTO.getTotalCount())
                .fundingId(lastOrderDTO.getFundingId())
                .userId(principalId)
                .reservationId(reservation.getId())
                .build();

        int rowResultCount = orderRepository.insert(order);

        return rowResultCount;
    }
}
