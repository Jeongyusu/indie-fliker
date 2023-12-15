package com.tenco.indiepicter.funding;


import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.*;
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

    //온라인 펀딩 상세보기
    public FundingDetailDTO findByFundingIdAboutDetailfunding(Integer fundingId);

    //오프라인 펀딩 상세보기(영화예매)
    public OfflineMovieDetailDTO findByFundingIdAboutOfflineMovie(Integer fundingId);

    //펀딩 등록하기
    public int saveFunding(FundingSaveDTO fundingSaveDTO);
}
