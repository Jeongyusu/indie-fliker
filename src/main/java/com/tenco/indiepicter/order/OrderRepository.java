package com.tenco.indiepicter.order;

import com.tenco.indiepicter.order.response.TotalCountAndPaymentDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderRepository {

    // 주문 등록
    public int insert(Order order);

    // 주문 삭제
    public int deleteById(Integer id);

    // 선택한 주문 상세 조회

    // 선택한 주문 티켓 수량 및 총 금액 조회
    public TotalCountAndPaymentDTO fineByFundingIdAndUserId(@Param("fundingId") Integer fundingId, @Param("principalId") Integer principalId);

    // 주문 전체 조회
    public List<Order> findAll();

    // 펀딩 Id와 userId로 주문 정보 조회
    public Order findByFundingIdAndUserId(@Param("fundingId") Integer fundingId, @Param("principalId")Integer principalId);
}
