package com.tenco.indiepicter.scrab;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ScrabRepository {

//  좋아요가 이미 있는지
    Integer isScrabExists(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);

//  좋아요 등록
    void insertScrab(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);

//  좋아요 삭제
    void deleteScrab(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);

// 좋아요 목록보기
    List<Scrab> selectScrab(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);
}
