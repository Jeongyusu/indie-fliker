package com.tenco.indiepicter.funding;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FundingRepository {
    //펀딩 장르별 조회
    public List<FundingResponse.FundingPlusDTO.MoviesByGenreDTO> findAllByGenre(@Param("genre") String genre, @Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

}
