package com.tenco.indiepicter.movie;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieRepository {

    //펀딩 아이디로 해당 영화 조회
    public Movie getMovieByFundingId(Integer fundingId);
}
