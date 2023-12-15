package com.tenco.indiepicter.order;

import com.tenco.indiepicter.order.response.LastOrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    // 오프라인 주문 정보 등록
    @Transactional
    public int saveOrder(LastOrderDTO lastOrderDTO, Integer principalId) {
        Order order = Order.builder()
                .selectedSeats(lastOrderDTO.getSeatNames())
                .productPrice(lastOrderDTO.getUnitPrice())
                .quantity(lastOrderDTO.getTotalCount())
                .fundingId(lastOrderDTO.getFundingId())
                .userId(principalId)
                .build();

        int rowResultCount = orderRepository.insert(order);

        return rowResultCount;
    }
}
