package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.DateUtil;
import com.tenco.indiepicter._core.utils.ParamStore;
import com.tenco.indiepicter.funding.fundingready.FundingReady;
import com.tenco.indiepicter.funding.fundingready.FundingReadyRepository;
import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.*;
import com.tenco.indiepicter.movie.MovieService;
import com.tenco.indiepicter.movie.moviephoto.MoviePhotoService;
import com.tenco.indiepicter.movie.moviestaff.MovieStaffService;
import com.tenco.indiepicter.order.response.LastOrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Slf4j
@Service
public class FundingService {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    private FundingRepository fundingRepository;

    @Autowired
    private FundingReadyRepository fundingReadyRepository;

    @Autowired
    private MovieService movieService;

    @Autowired
    private MovieStaffService movieStaffService;

    @Autowired
    private MoviePhotoService moviePhotoService;


    public List<FundingDTO> moviesByGenre(String genre, Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByGenre(genre, pageSize, offset);
    }

    // 펀딩
    public List<FundingDTO> moviesByMain(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByMain(pageSize, offset);
    }

    // 개봉한 온라인 영화 페이징
    public List<OnAirMoviePageDTO> onAirMoviePage(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByOnAirPage(pageSize, offset);
    }

    // 개봉한 오프라인 영화 페이징
    public List<OffAirMoviePageDTO> offAirMoviePage(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByOffAirPage(pageSize, offset);
    }

    // 개봉한 온라인 영화 목록
    public List<OnAirMovieDTO> onAirMovies() {
        return fundingRepository.findAllByOnAir();
    }

    // 개봉한 온라인 영화 랭킹 순
    public List<OnAirMovieRankingDTO> onAirRankedMovies() {
        return fundingRepository.findAllByOnAirAndRanking();
    }

    // 개봉 예정인 온라인 영화 목록
    public List<OnDDayMovieDTO> onDDayMovies(Integer page, Integer pageSize) {
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findByOnlineDDay(pageSize, offset);
    }

    // 개봉한 오프라인 영화 목록
    public List<OffAirMovieDTO> offAirMovies() {
        return fundingRepository.findAllByOffAir();
    }

    // 개봉한 오프라인 영화 랭킹 순
    public List<OffAirMovieRankingDTO> offAirRankedMovies() {
        return fundingRepository.findAllByOffAirAndRanking();
    }

    // 유저가 구매한 개봉 온라인 영화 목록
    public List<OnAirMovieByUserDTO> onAirMovieByUser(Integer principalId){
        return fundingRepository.findByUserToOnAir(principalId);
    }

    public FundingDetailDTO detailFunding(Integer fundingId) {
        return fundingRepository.findByFundingIdAboutDetailFunding(fundingId);
    }

    public OfflineMovieDetailDTO detailOfflineMovie(Integer fundingId) {
        return fundingRepository.findByFundingIdAboutOfflineMovie(fundingId);
    }

    @Transactional
    public int saveFunding(FundingSaveDTO requestDTO){
        Integer movieId = movieService.saveMovie(requestDTO);
        movieStaffService.saveMovieStaff(requestDTO, movieId);
        moviePhotoService.saveMoviePhotos(requestDTO, movieId);

        Funding funding = Funding.builder()
                        .targetPrice(requestDTO.getTargetPrice())
                        .pricePerOnetime(requestDTO.getPricePerOnetime())
                        .releaseDate(DateUtil.stringToDate(requestDTO.getFundingPeriodStart()))
                        .endDate(DateUtil.stringToDate(requestDTO.getFundingPeriodEnd()))
                        .movieId(movieId)
                        .build();
        int resultRowCount =  fundingRepository.saveFunding(funding);
        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }


    // 결제 후 펀딩 누적 금액 및 참여 인원 추가하기
    @Transactional
    public int addFundingTarget(LastOrderDTO RequestDTO) {
        Funding funding = fundingRepository.findById(RequestDTO.getFundingId());

        int addPresentPrice = funding.getPresentPrice() + RequestDTO.getFinalPrice();
        int addPeopleCount = funding.getPeopleCount() + RequestDTO.getTotalCount();

        return fundingRepository.updateById(RequestDTO.getFundingId(),addPresentPrice, addPeopleCount);
    }

    //자주 묻는 질문 키워드로 검색하기
    public List<SearchResultDTO> searchKeyword(String keyword){
        return fundingRepository.findByKeyword(keyword);
    }

    //펀딩 준비테이블 -> 펀딩 테이블 인서트하기
    @Transactional
    public int readyToOrigin(Integer id){
        FundingReady fundingReady = fundingReadyRepository.findById(id);
        Funding funding = Funding.builder()
                .id(fundingReady.getId())
                .targetPrice(fundingReady.getTargetPrice())
                .pricePerOnetime(fundingReady.getPricePerOnetime())
                .peopleCount(fundingReady.getPeopleCount())
                .releaseDate(fundingReady.getReleaseDate())
                .endDate(fundingReady.getEndDate())
                .movieId(fundingReady.getMovieId())
                .build();
        int resultRowCount =  fundingRepository.saveFunding(funding);
        // 등록된 funding의 PK를 기억하기
        ParamStore.saveFundingPK = fundingReady.getId();

        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }
    //어드민 페이지 전체 펀딩 수정/삭제 리스트 조회
    public List<AdminFundingModifyDTO> findAllAdminFundingModify(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllAdminFundingModify(pageSize, offset);
    }

    //어드민 페이지 온라인 상영기간 설정 리스트 페이징 조회
    public List<AdminOnlineStreamingDTO> findAllAdminPeriodSetting(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllAdminPeriodSetting(pageSize, offset);
    }

    //어드민 페이지 오프라인 상영기간 설정 리스트 조회
    public List<AdminOfflineStreamingDTO> findAllAdminOfflinePeriodSetting(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllAdminOfflinePeriodSetting(pageSize, offset);
    }

    public AdminFundingUpdateFormDTO findByIdForAdminFundingModify(Integer id){
        return fundingRepository.findByIdForAdminFundingModify(id);
    }

    @Transactional
    public void updateById(AdminRequestFundingUpdateFormDTO adminRequestFundingUpdateFormDTO){
        Funding funding = Funding.builder()
                .id(adminRequestFundingUpdateFormDTO.getFundingId())
                .targetPrice(adminRequestFundingUpdateFormDTO.getTargetPrice())
                .pricePerOnetime(adminRequestFundingUpdateFormDTO.getPricePerOnetime())
                .releaseDate(DateUtil.stringToDate(adminRequestFundingUpdateFormDTO.getFundingPeriodStart()))
                .endDate(DateUtil.stringToDate(adminRequestFundingUpdateFormDTO.getFundingPeriodEnd()))
                .movieId(adminRequestFundingUpdateFormDTO.getMovieId())
                .build();
        int resultRowCount =  fundingRepository.updateByIdForAdmin(funding);
        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 업데이트 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        movieService.updateById(adminRequestFundingUpdateFormDTO);
        movieStaffService.updateById(adminRequestFundingUpdateFormDTO);
        moviePhotoService.updateById(adminRequestFundingUpdateFormDTO);
    }

    @Transactional
    public int deleteById(Integer id){
        int resultRowCount =  fundingRepository.deleteById(id);
        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

    @Transactional
    public int updateEndDateById(Integer id){
        int resultRowCount =  fundingRepository.updateEndDateById(id);
        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 종료 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

    // 어드민 페이지 펀딩 종료/수정 검색어 조회
    public List<AdminFundingManagementSearchDTO> findAllAdminFundingModifySearch(String keyword){
        return fundingRepository.findAllAdminFundingModifySearch(keyword);
    }

    //어드민 온라인 상영기간 및 채팅기간 설정 페이지 검색어 조회
    public List<AdminOnlineStreamingSearchDTO> searchKeywordAboutOnlineStreaming(String keyword){
        return fundingRepository.searchKeywordAboutOnlineStreaming(keyword);
    }

    //어드민 오프라인 상영기간 설정 페이지 검색어 조회
    public List<AdminOfflineStreamingSearchDTO> searchKeywordAboutOfflineStreaming(String keyword){
        return fundingRepository.searchKeywordAboutOfflineStreaming(keyword);
    }

    //어드민 페이지 펀딩현황 조회
    public List<AdminFundingProceedingDTO> findAllAboutFundingProceeding(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllAboutFundingProceeding(pageSize, offset);
    }

    //어드민 페이지 펀딩 현황 검색어 조회
    public List<AdminFundingProceedingSearchDTO> searchKeywordAboutFundingProceeding(String keyword){
        return fundingRepository.searchKeywordAboutFundingProceeding(keyword);
    }
}