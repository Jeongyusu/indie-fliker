package com.tenco.indiepicter.seat;

import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SeatRepository {

    // 좌석 예매 등록
    public int insert(Seat seat);

    // 좌석 예매 삭제
    public int deleteById(Integer id);

    // 상영시간에 따른 좌석 조회
    public List<ExistSeatDTO> findByRunningDateId(Integer runningDateId);

    // 좌석 전체 조회
    public List<Seat> findAll();
}
