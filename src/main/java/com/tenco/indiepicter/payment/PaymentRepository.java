package com.tenco.indiepicter.payment;

import com.tenco.indiepicter.theater.Theater;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaymentRepository {

    // 영화관 등록
    public int insert(Theater theater);

    // 영화관 수정
    public int updateById(Theater theater);

    // 영화관 삭제
    public int deleteById(Integer id);

    // 영화관 1개 조회
    public Theater findById(Integer id);

    // 영화관 전체 조회
    public List<Theater> findAll();
}
