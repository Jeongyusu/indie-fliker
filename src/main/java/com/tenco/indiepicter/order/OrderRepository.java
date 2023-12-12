package com.tenco.indiepicter.order;

import com.tenco.indiepicter.seat.Seat;
import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderRepository {

    // 주문 등록
    public int insert(Order order);

    // 주문 삭제
    public int deleteById(Integer id);

    // 선택한 주문 내역 조회
    public List<Order> findById(Integer id);

    // 주문 전체 조회
    public List<Order> findAll();
}
