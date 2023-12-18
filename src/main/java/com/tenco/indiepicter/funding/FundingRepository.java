package com.tenco.indiepicter.funding;

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
    public int saveFunding(Funding funding);

    // 선택한 온라인 영화 상세 조회 = 온라인 펀딩 결제창
    public SelectFundingDTO findBySelectFunding(Integer movieId);

    // 펀딩 조회하기
    public Funding findById(Integer fundingId);

    // 펀딩 누적 금액, 참여 인원 추가하기
    public int updateById(@Param("fundingId") Integer fundingId, @Param("addPresentPrice") Integer addPresentPrice, @Param("addPeopleCount") Integer addPeopleCount);

    // 펀딩 검색결과 조회
    public List<SearchResultDTO> findByKeyword(String keyword);
}
