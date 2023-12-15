package com.tenco.indiepicter.payment;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.order.Order;
import com.tenco.indiepicter.order.OrderRepository;
import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.order.response.OrderAndReservationInfoDTO;
import com.tenco.indiepicter.seat.request.SelectSeatDTO;
import com.tenco.indiepicter.runningschedule.RunningScheduleRepository;
import com.tenco.indiepicter.runningschedule.response.SelectRunningScheduleAndPlaceDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import com.tenco.indiepicter.payment.response.MyOfflinePaymentDTO;
import com.tenco.indiepicter.payment.response.MyOnlinePaymentDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Slf4j
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private RunningScheduleRepository runningScheduleRepository;

    @Autowired
    private OrderRepository orderRepository;

    // 상영 정보 가져오기
    public SelectRunningScheduleAndPlaceDTO offPayment(SelectSeatDTO selectSeatDTO) {
        SelectRunningScheduleAndPlaceDTO responseDTO = runningScheduleRepository.findByRunningScheduleIdAndPlace(selectSeatDTO.getRunningDateId());
        responseDTO.setMovieId(selectSeatDTO.getMovieId());
        responseDTO.setRunningDateId(selectSeatDTO.getRunningDateId());
        responseDTO.setTotalPrice(selectSeatDTO.getPrice());
        responseDTO.setTotalCount(selectSeatDTO.getCount());
        responseDTO.setSeatNames(selectSeatDTO.getSelectSeats());
        return responseDTO;
    }
	
	// 온라인 결제 내역
	public List<MyOnlinePaymentDTO> findByOnlinePaymentId(Integer id){
		
		return this.paymentRepository.findByOnlinePaymentId(id);
	}
	
	// 오프라인 결제 내역
	public List<MyOfflinePaymentDTO> findByOfflinePaymentId(Integer id){
		
		return this.paymentRepository.findByOfflinePaymentId(id);
	}

    // 오프라인 결제 정보 등록
    @Transactional
    public int savePayment(LastOrderDTO lastOrderDTO){
         // reservationCode로 orderId 찾아오기
        OrderAndReservationInfoDTO responseDTO = orderRepository.findByReservationCode(lastOrderDTO.getReservationCode());
        if(responseDTO == null){
            throw new MyDynamicException("주문 내역을 찾을 수 없습니다.", HttpStatus.BAD_REQUEST);
        }

        Payment payment = Payment.builder()
                .totalPrice(lastOrderDTO.getFinalPrice() + lastOrderDTO.getDiscountPrice())
                .discountPrice(lastOrderDTO.getDiscountPrice())
                .finalPrice(lastOrderDTO.getFinalPrice())
                .paymentTypeId(lastOrderDTO.getPaymentTypeId())
                .orderId(responseDTO.getOrderId())
                .build();

        return paymentRepository.insert(payment);
    }

}
