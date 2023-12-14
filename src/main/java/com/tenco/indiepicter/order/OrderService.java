package com.tenco.indiepicter.order;

import com.tenco.indiepicter.funding.FundingRepository;
import com.tenco.indiepicter.order.request.SaveOrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private FundingRepository fundingRepository;

    // order 저장
    @Transactional

    public int saveOrder(SaveOrderDTO saveOrderDTO, Integer principalId) {
        Order order = Order.builder()
                .selectedSeats(saveOrderDTO.getSeatNames())
                .productPrice(saveOrderDTO.getUnitPrice())
                .quantity(saveOrderDTO.getTotalCount())
                .fundingId(saveOrderDTO.getFundingId())
                .userId(1) // TODO : principalId 넣어야함
                .build();
        int rowResultCount = orderRepository.insert(order);
        return rowResultCount;
    }
}
