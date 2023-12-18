package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.DateUtil;
import com.tenco.indiepicter.banner.BannerRepository;
import com.tenco.indiepicter.banner.BannerService;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.*;
import com.tenco.indiepicter.movie.MovieService;
import com.tenco.indiepicter.movie.moviephoto.MoviePhotoService;
import com.tenco.indiepicter.movie.moviestaff.MovieStaffService;
import com.tenco.indiepicter.scrab.ScrabService;
import com.tenco.indiepicter.theater.TheaterService;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
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

    public List<OnAirMovieDTO> onAirMovies(){
        return fundingRepository.findAllByOnAir();
    }

    public List<OnAirMovieRankingDTO> onAirRankedMovies(){
        return fundingRepository.findAllByOnAirAndRanking();
    }

    public FundingDetailDTO detailFunding (Integer fundingId){
        return fundingRepository.findByFundingIdAboutDetailfunding(fundingId);
    }

    public OfflineMovieDetailDTO detailOfflineMovie (Integer fundingId){
        return fundingRepository.findByFundingIdAboutOfflineMovie(fundingId);
    }

    @Transactional
    public int saveFunding(FundingSaveDTO requestDTO){
        log.debug("==========여기까지실행1==========");
        Integer movieId = movieService.saveMovie(requestDTO);
        log.debug("==========여기까지실행2==========");
        movieStaffService.saveMovieStaff(requestDTO, movieId);
        log.debug("==========여기까지실행3==========");
        moviePhotoService.saveMoviePhotos(requestDTO, movieId);
        log.debug("==========여기까지실행4==========");

        Funding funding = Funding.builder()
                        .targetPrice(requestDTO.getTargetPrice())
                        .pricePerOnetime(requestDTO.getPricePerOnetime())
                        .releaseDate(DateUtil.stringToDate(requestDTO.getFundingPeriodStart()))
                        .endDate(DateUtil.stringToDate(requestDTO.getFundingPeriodEnd()))
                        .movieId(movieId)
                        .build();
        log.debug("==========여기까지실행5==========");
        int resultRowCount =  fundingRepository.saveFunding(funding);
        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }




}
