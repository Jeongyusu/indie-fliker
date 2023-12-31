package com.tenco.indiepicter.theater;

import com.tenco.indiepicter.theater.response.TheaterListDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TheaterRepository {

    // 영화관 등록
    public int insert(Theater theater);

    // 영화관 수정
    public int updateById(Theater theater);

    // 영화관 삭제
    public int deleteById(Integer id);

    // 영화관 1개 조회
    public Theater findById(Integer id);

    // 메인페이지(영화예매) 극장 정보 조회
    public List<TheaterListDTO> findAllByCustom();
}
