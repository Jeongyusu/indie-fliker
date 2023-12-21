package com.tenco.indiepicter.payment;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.funding.FundingRepository;
import com.tenco.indiepicter.funding.response.SelectFundingDTO;
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
    private FundingRepository fundingRepository;

    @Autowired
    private OrderRepository orderRepository;

    // 선택한 오프라인 상영 일정 상세 조회 + 영화관 정보
    public SelectRunningScheduleAndPlaceDTO offPayment(SelectSeatDTO requestDTO) {
        SelectRunningScheduleAndPlaceDTO responseDTO = runningScheduleRepository.findByRunningScheduleIdAndPlace(requestDTO.getRunningDateId());

        responseDTO.setMovieId(requestDTO.getMovieId());
        responseDTO.setRunningDateId(requestDTO.getRunningDateId());
        responseDTO.setTotalPrice(requestDTO.getPrice());
        responseDTO.setTotalCount(requestDTO.getCount());
        responseDTO.setSeatNames(requestDTO.getSelectSeats());
        return responseDTO;
    }

    // 선택한 온라인 영화 상세 조회 = 온라인 펀딩 결제창
    public SelectFundingDTO onPayment(Integer movieId) {
        SelectFundingDTO responseDTO = fundingRepository.findBySelectFunding(movieId);

        return  responseDTO;
    }

	
	// 온라인 결제 내역
	public List<MyOnlinePaymentDTO> findByOnlinePaymentId(Integer id){
		
		return this.paymentRepository.findByOnlinePaymentId(id);
	}
	
	// 오프라인 결제 내역
	public List<MyOfflinePaymentDTO> findByOfflinePaymentId(Integer id){
		
		return this.paymentRepository.findByOfflinePaymentId(id);
	}

    // 오프라인 / 온라인 결제 정보 등록
    @Transactional
    public int savePayment(LastOrderDTO requestDTO){
         // reservationCode로 orderId 찾아오기
        OrderAndReservationInfoDTO responseDTO = orderRepository.findByReservationCode(requestDTO.getReservationCode());
        if(responseDTO == null){
            throw new MyDynamicException("주문 내역을 찾을 수 없습니다.", HttpStatus.BAD_REQUEST);
        }

        Payment payment = Payment.builder()
                .totalPrice(requestDTO.getFinalPrice() + requestDTO.getDiscountPrice())
                .discountPrice(requestDTO.getDiscountPrice())
                .finalPrice(requestDTO.getFinalPrice())
                .paymentTypeId(requestDTO.getPaymentTypeId())
                .orderId(responseDTO.getOrderId())
                .build();

        return paymentRepository.insert(payment);
    }

    @Transactional
    public int deleteById(Integer paymentId) {
        return paymentRepository.deleteById(paymentId);
    }
}
