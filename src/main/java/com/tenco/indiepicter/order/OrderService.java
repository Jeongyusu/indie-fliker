package com.tenco.indiepicter.order;

import com.tenco.indiepicter.funding.FundingRepository;
import com.tenco.indiepicter.funding.response.FindByFundingIdDTO;
import com.tenco.indiepicter.order.request.OrderDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private FundingRepository fundingRepository;

    public void order(OrderDTO orderDTO, Integer principalId) {

        FindByFundingIdDTO responseDTO = fundingRepository.findByMovieId(orderDTO.getMovieId());

        Order order = Order.builder()
                .selectedSeats(orderDTO.getLastSelectSeatList())
                .productPrice(orderDTO.getPrice())
                .quantity(orderDTO.getCount())
                .fundingId(responseDTO.getFundingId())
                .userId(principalId)
                .build();

        orderRepository.insert(order);
    }
}
