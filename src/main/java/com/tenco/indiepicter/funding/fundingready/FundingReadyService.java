package com.tenco.indiepicter.funding.fundingready;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.DateUtil;
import com.tenco.indiepicter.funding.Funding;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.FundingDetailDTO;
import com.tenco.indiepicter.funding.response.FundingReadyDTO;
import com.tenco.indiepicter.funding.response.FundingReadyDetailDTO;
import com.tenco.indiepicter.movie.MovieService;
import com.tenco.indiepicter.movie.moviephoto.MoviePhotoService;
import com.tenco.indiepicter.movie.moviestaff.MovieStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FundingReadyService {

    @Autowired
    private MovieService movieService;

    @Autowired
    private MovieStaffService movieStaffService;

    @Autowired
    private MoviePhotoService moviePhotoService;

    @Autowired
    private FundingReadyRepository fundingReadyRepository;

    @Transactional
    public int saveFundingReady(FundingSaveDTO requestDTO){
        Integer movieId = movieService.saveMovie(requestDTO);
        movieStaffService.saveMovieStaff(requestDTO, movieId);
        moviePhotoService.saveMoviePhotos(requestDTO, movieId);

        FundingReady fundingReady = FundingReady.builder()
                .targetPrice(requestDTO.getTargetPrice())
                .pricePerOnetime(requestDTO.getPricePerOnetime())
                .releaseDate(DateUtil.stringToDate(requestDTO.getFundingPeriodStart()))
                .endDate(DateUtil.stringToDate(requestDTO.getFundingPeriodEnd()))
                .movieId(movieId)
                .build();
        int resultRowCount =  fundingReadyRepository.saveFunding(fundingReady);
        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

    //펀딩 준비테이블 리스트 조회 지금 작업
    public List<FundingReadyDTO> findAllFundingReady(Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingReadyRepository.findAllFundingReady(pageSize, offset);
    }

    // 펀딩 준비테이블 상세보기
    public FundingReadyDetailDTO detailFunding(Integer fundingReadyId) {
        return fundingReadyRepository.findByFundingIdAboutDetailfundingReady(fundingReadyId);
    }

    //펀딩 준비테이블 삭제
    @Transactional
    public void deleteById(Integer id){
        fundingReadyRepository.deleteById(id);
    }

    public FundingReady findById(Integer id) {
        return fundingReadyRepository.findById(id);
    }
}
