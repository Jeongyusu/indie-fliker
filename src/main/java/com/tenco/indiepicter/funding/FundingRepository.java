package com.tenco.indiepicter.funding;


import com.tenco.indiepicter.funding.response.FindByFundingIdDTO;
import com.tenco.indiepicter.funding.response.MoviesByGenreDTO;
import com.tenco.indiepicter.funding.response.OnAirMovieDTO;
import com.tenco.indiepicter.funding.response.OnAirMovieRankingDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FundingRepository {
    //펀딩 장르별 조회
    public List<MoviesByGenreDTO> findAllByGenre(@Param("genre") String genre, @Param("pageSize") Integer pageSize, @Param("offset") Integer offset);


    // movie_id로 funding_id 조회
    public FindByFundingIdDTO findByMovieId(Integer movieId);

    //상영중 영화 조회
    public List<OnAirMovieDTO> findAllByOnAir();

    //상영중 영화 장르별 조회
    public List<OnAirMovieRankingDTO> findAllByOnAirAndRanking();
}
