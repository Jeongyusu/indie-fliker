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


    public List<MoviesByGenreDTO> moviesByGenre(String genre, Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByGenre(genre, pageSize, offset);
    }

    public List<OnAirMovieDTO> onAirMovies() {
        return fundingRepository.findAllByOnAir();
    }

    public List<OnAirMovieRankingDTO> onAirRankedMovies() {
        return fundingRepository.findAllByOnAirAndRanking();
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
    public List<AdminFundingModifyDTO> findAllAdminFundingModify(){
        return fundingRepository.findAllAdminFundingModify();
    }

    //어드민 페이지 온라인 상영기간 설정 리스트 조회
    public List<AdminOnlineStreamingDTO> findAllAdminPeriodSetting(){
        return fundingRepository.findAllAdminPeriodSetting();
    }

    //어드민 페이지 오프라인 상영기간 설정 리스트 조회
    public List<AdminOfflineStreamingDTO> findAllAdminOfflinePeriodSetting(){
        return fundingRepository.findAllAdminOfflinePeriodSetting();
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


}