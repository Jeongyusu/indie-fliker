package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.DateUtil;
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
        return fundingRepository.findByFundingIdAboutDetailfunding(fundingId);
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

    public List<SearchResultDTO> searchKeyword(String keyword){
        return fundingRepository.findByKeyword(keyword);
    }

}