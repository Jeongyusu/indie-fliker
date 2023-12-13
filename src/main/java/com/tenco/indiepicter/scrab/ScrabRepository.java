package com.tenco.indiepicter.scrab;

import org.apache.ibatis.annotations.*;

@Mapper
public interface ScrabRepository {

//    @Select("SELECT COUNT(*) FROM scrab WHERE user_id = #{userId} AND funding_id = #{fundingId}")
    Integer isScrabExists(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);

//    @Insert("INSERT INTO scrab (user_id, funding_id) VALUES (#{userId}, #{fundingId})")
    void insertScrab(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);

//    @Delete("DELETE FROM scrab WHERE user_id = #{userId} AND funding_id = #{fundingId}")
    void deleteScrab(@Param("userId") Integer userId, @Param("fundingId") Integer fundingId);
}
