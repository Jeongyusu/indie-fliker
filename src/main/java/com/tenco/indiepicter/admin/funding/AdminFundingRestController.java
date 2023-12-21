package com.tenco.indiepicter.admin.funding;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter._core.utils.ParamStore;
import com.tenco.indiepicter._core.utils.Script;
import com.tenco.indiepicter.funding.Funding;
import com.tenco.indiepicter.funding.FundingRepository;
import com.tenco.indiepicter.funding.FundingService;
import com.tenco.indiepicter.funding.fundingready.FundingReady;
import com.tenco.indiepicter.funding.fundingready.FundingReadyRepository;
import com.tenco.indiepicter.funding.fundingready.FundingReadyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Slf4j
@RequestMapping("/admin")
@RestController
public class AdminFundingRestController {

    @Autowired
    private FundingReadyRepository fundingReadyRepository;

    @Autowired
    private FundingRepository fundingRepository;

    @Autowired
    private FundingService fundingService;

    @Autowired
    private FundingReadyService fundingReadyService;

    @PostMapping("/funding-ready/save")
    public ResponseEntity<?> saveFundingReady(@RequestBody Map<String, Integer> fundingReadyId){


        // 펀딩 준비 테이블 -> 펀딩 테이블 데이터 복사
        fundingService.readyToOrigin(fundingReadyId.get("fundingId"));
        fundingReadyService.deleteById(fundingReadyId.get("fundingId"));
        return ResponseEntity.ok().body(ApiUtils.success(null));
    }

    @GetMapping("/back-only")
    public String ScriptBack(){
        return Script.backOnly();
    }
}
