package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.response.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FundingRepository {
    //펀딩 장르별 조회
    public List<MoviesByGenreDTO> findAllByGenre(@Param("genre") String genre, @Param("pageSize") Integer pageSize, @Param("offset") Integer offset);


    //펀딩 모두(메인) 조회
    public List<MoviesByMainDTO> findAllByMain(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    // movie_id로 funding_id 조회
    public FindByFundingIdDTO findByMovieId(Integer movieId);

    //온라인 상영중 영화 조회
    public List<OnAirMovieDTO> findAllByOnAir();

    //온라인 상영중 영화 장르별 조회
    public List<OnAirMovieRankingDTO> findAllByOnAirAndRanking();

    //오프라인 상영중 영화 조회
    List<OffAirMovieDTO> findAllByOffAir();

    //오프라인 상영중 영화 장르별 조회
    List<OffAirMovieRankingDTO> findAllByOffAirAndRanking();

    //온라인 펀딩 상세보기
    public FundingDetailDTO findByFundingIdAboutDetailFunding(Integer fundingId);

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

    // 관리자 페이지 펀딩 수정/삭제 기존 펀딩 전체 조회
    public List<AdminFundingModifyDTO> findAllAdminFundingModify();

    // 펀딩 온라인 상영기간 설정
    public List<AdminOnlineStreamingDTO> findAllAdminPeriodSetting();

    // 펀딩 온라인 개봉 예정 영화보기
    public List<OnDDayMovieDTO> findByOnlineDDay();
    // 펀딩 오프라인 상영기간 설정
    public List<AdminOfflineStreamingDTO> findAllAdminOfflinePeriodSetting();

    // 어드민 펀딩 수정 폼 정보조회
    public AdminFundingUpdateFormDTO findByIdForAdminFundingModify(Integer id);

    // 어드민 페이지 펀딩 수정 업데이트
    public int updateByIdForAdmin(Funding funding);
}
