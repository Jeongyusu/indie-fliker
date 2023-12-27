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
import com.tenco.indiepicter.funding.response.AdminFundingProceedingDTO;
import com.tenco.indiepicter.funding.response.BannerDTO;
import com.tenco.indiepicter.funding.response.FundingPlusDTO;
import com.tenco.indiepicter.funding.response.MoviesByGenreDTO;
import com.tenco.indiepicter.movie.MovieService;
import com.tenco.indiepicter.movie.moviefile.MovieFileService;
import com.tenco.indiepicter.movie.moviephoto.MoviePhotoService;
import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
import com.tenco.indiepicter.movie.moviestaff.MovieStaffService;
import com.tenco.indiepicter.movie.request.OfflineOpenDateSettingDTO;
import com.tenco.indiepicter.movie.request.OnlineOpenDateSettingDTO;
import com.tenco.indiepicter.movie.response.OfflineStreamingDateSettingDTO;
import com.tenco.indiepicter.movie.response.OnlineStreamingDateSettingDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
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

    @Autowired
    private MovieService movieService;

    @Autowired
    private MoviePhotoService moviePhotoService;

    @Autowired
    private MovieStaffService movieStaffService;

    @Autowired
    private MovieFileService movieFileService;

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

    @GetMapping("/movie-open/{id}")
    public ResponseEntity<?> movieOpenSetting(@PathVariable Integer id){
        OnlineStreamingDateSettingDTO onlineStreamingDateSettingDTO = movieService.findById(id);
        log.debug("=========================");
        log.debug(onlineStreamingDateSettingDTO.toString());
        return ResponseEntity.ok().body(ApiUtils.success(onlineStreamingDateSettingDTO));

    }

    @GetMapping("/off-movie-open/{id}")
    public ResponseEntity<?> offMovieOpenSetting(@PathVariable Integer id){
        OfflineStreamingDateSettingDTO offlineStreamingDateSettingDTO = movieService.findByIdOffline(id);
        log.debug("=========================");
        log.debug(offlineStreamingDateSettingDTO.toString());
        return ResponseEntity.ok().body(ApiUtils.success(offlineStreamingDateSettingDTO));

    }

    @PostMapping("/movie-open/save")
    public ResponseEntity<?> movieOpenDateUpdate(@RequestBody OnlineOpenDateSettingDTO onlineOpenDateSettingDTO){
        log.debug("====================");
        log.debug(onlineOpenDateSettingDTO.toString());
        movieService.updateMovieOpenDate(onlineOpenDateSettingDTO);
        return ResponseEntity.ok().body(ApiUtils.success(null));
    }

    @PostMapping("/off-movie-open/save")
    public ResponseEntity<?> offMovieOpenDateUpdate(@RequestBody OfflineOpenDateSettingDTO offlineOpenDateSettingDTO){
        log.debug("====================");
        log.debug(offlineOpenDateSettingDTO.toString());
        movieService.updateOffMovieOpenDate(offlineOpenDateSettingDTO);
        return ResponseEntity.ok().body(ApiUtils.success(null));
    }

    @PostMapping("/funding/end")
    public ResponseEntity<?> deleteFunding(@RequestBody Map<String, Integer> Index){
        fundingService.updateEndDateById(Index.get("fundingId"));
        return ResponseEntity.ok().body(ApiUtils.success(null));
    }

    @GetMapping ("/funding/confirm/more-data")
    public ResponseEntity<?> fundingPlus(@RequestParam(name="page", defaultValue = "1") Integer page) {
        List<AdminFundingProceedingDTO> adminFundingProceedingDTOs = fundingService.findAllAboutFundingProceeding(page, 8);
        return ResponseEntity.ok().body(ApiUtils.success(adminFundingProceedingDTOs));
    }
}
