package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter.scrab.response.ScrabResponseDTO;
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

    // 좋아요 리스트 삭제
    boolean deleteListScrab(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);

    // 좋아요 목록 보기
    List<ScrabResponseDTO> viewScrabList(@Param("userId") Integer userId);

}
