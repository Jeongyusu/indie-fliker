package com.tenco.indiepicter.payment;

import com.tenco.indiepicter.order.OrderRepository;
import com.tenco.indiepicter.order.request.OrderDTO;
import com.tenco.indiepicter.runningschedule.RunningScheduleRepository;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleAndPlaceDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private RunningScheduleRepository runningScheduleRepository;

    public SelectRunningScheduleAndPlaceDTO offPayment(OrderDTO orderDTO) {
        // 상영 정보 가져오기
        SelectRunningScheduleAndPlaceDTO responseDTO = runningScheduleRepository.findByRunningScheduleIdAndPlace(orderDTO.getRunningDateId());
        responseDTO.setMovieId(orderDTO.getMovieId());
        responseDTO.setRunningDateId(orderDTO.getRunningDateId());
        responseDTO.setTotalPrice(orderDTO.getPrice());
        responseDTO.setTotalCount(orderDTO.getCount());

        return responseDTO;
    }
}
