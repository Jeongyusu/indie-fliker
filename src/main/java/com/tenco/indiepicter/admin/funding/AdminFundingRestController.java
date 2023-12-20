package com.tenco.indiepicter.admin.funding;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.funding.Funding;
import com.tenco.indiepicter.funding.FundingRepository;
import com.tenco.indiepicter.funding.fundingready.FundingReady;
import com.tenco.indiepicter.funding.fundingready.FundingReadyRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@Slf4j
@RequestMapping("/admin")
@RestController
public class AdminFundingRestController {

    @Autowired
    private FundingReadyRepository fundingReadyRepository;

    @Autowired
    private FundingRepository fundingRepository;

    @PostMapping("/funding-ready/save")
    public ResponseEntity<?> saveFundingReady(@RequestBody Map<String, Integer> fundingId){
        log.debug("======================");
        log.debug("=======레스트컨트롤러진입=======");
        log.debug(fundingId.toString());

        FundingReady fundingReady = fundingReadyRepository.findById(fundingId.get("fundingId"));
        Funding funding = Funding.builder()
                .id(fundingReady.getId())
                .targetPrice(fundingReady.getTargetPrice())
                .pricePerOnetime(fundingReady.getPricePerOnetime())
                .peopleCount(fundingReady.getPeopleCount())
                .releaseDate(fundingReady.getReleaseDate())
                .endDate(fundingReady.getEndDate())
                .movieId(fundingReady.getMovieId())
                .build();
        log.debug("=======빌더생성완료=======");

        int resultRowCount =  fundingRepository.saveFunding(funding);
        log.debug("=======펀딩 등록 완료=======");

        if(resultRowCount != 1) {
            throw new MyDynamicException("펀딩 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return ResponseEntity.ok().body(ApiUtils.success(null));
    }
}
