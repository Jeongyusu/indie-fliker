package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.response.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FundingRepository {
    //펀딩 장르별 조회
    public List<FundingDTO> findAllByGenre(@Param("genre") String genre, @Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    //펀딩 모두(메인) 조회
    public List<FundingDTO> findAllByMain(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    //온라인 영화 페이징 조회
    public List<OnAirMoviePageDTO> findAllByOnAirPage(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    //오프라인 영화 페이징 조회
    public List<OffAirMoviePageDTO> findAllByOffAirPage(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    // movie_id로 funding_id 조회
    public FindByFundingIdDTO findByMovieId(Integer movieId);

    //온라인 상영중 영화 조회
    public List<OnAirMovieDTO> findAllByOnAir();

    //오프라인 상영중 영화 조회
    List<OffAirMovieDTO> findAllByOffAir();

    //유저가 구매한 온라인 상영중 영화 조회
    public List<OnAirMovieByUserDTO> findByUserToOnAir(Integer principalId);

    //유저가 구매한 오프라인 상영중 영화 조회
    List<OffAirMovieByUserDTO> findByUserToOffAir(Integer principalId);

    //온라인 상영중 영화 장르별 조회
    public List<OnAirMovieRankingDTO> findAllByOnAirAndRanking();

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
    public List<AdminFundingModifyDTO> findAllAdminFundingModify(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    // 펀딩 온라인 상영기간 설정
    public List<AdminOnlineStreamingDTO> findAllAdminPeriodSetting(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    // 펀딩 온라인 개봉 예정 영화보기(페이징)
    public List<OnDDayMovieDTO> findByOnlineDDay(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    // 펀딩 오프라인 상영기간 설정
    public List<AdminOfflineStreamingDTO> findAllAdminOfflinePeriodSetting(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    // 어드민 펀딩 수정 폼 정보조회
    public AdminFundingUpdateFormDTO findByIdForAdminFundingModify(Integer id);

    // 어드민 페이지 펀딩 수정 업데이트
    public int updateByIdForAdmin(Funding funding);

    // 어드민 페이지 펀딩 삭제
    public int deleteById(Integer id);

    //어드민 페이지 펀딩 종료
    public int updateEndDateById(Integer id);

    //어드민 페이지 펀딩 수정/종료 페이지 검색어 조회
    public List<AdminFundingManagementSearchDTO> findAllAdminFundingModifySearch(String keyword);

    //어드민 온라인 상영기간, 채팅시간 설정 페이지 검색어 조회
    public List<AdminOnlineStreamingSearchDTO> searchKeywordAboutOnlineStreaming(String keyword);

    //어드민 오프라인 상영기간 설정 페이지 검색어 조회
    public List<AdminOfflineStreamingSearchDTO>  searchKeywordAboutOfflineStreaming(String keyword);

    //어드민 페이지 펀딩 현황 조회
    public List<AdminFundingProceedingDTO> findAllAboutFundingProceeding(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    //어드민 페이지 펀딩 현황 검색어 조회
    public List<AdminFundingProceedingSearchDTO> searchKeywordAboutFundingProceeding(String keyword);
}
