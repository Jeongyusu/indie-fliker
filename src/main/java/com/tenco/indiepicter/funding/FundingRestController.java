package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.banner.BannerService;
import com.tenco.indiepicter.funding.response.BannerDTO;
import com.tenco.indiepicter.funding.response.FundingPlusDTO;
import com.tenco.indiepicter.funding.response.MoviesByGenreDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
public class FundingRestController {

    @Autowired
    private FundingService fundingService;

    @Autowired
    private BannerService bannerService;

    @GetMapping ("/api/fundings")
    public ResponseEntity<?> fundingPlus(@RequestParam(name="genre", defaultValue = "극영화") String genre, @RequestParam(name="page", defaultValue = "1") Integer page) {
        List<MoviesByGenreDTO> moviesByGenreDTOs = fundingService.MoviesByGenre(genre, page, 5);
        log.debug("무비장르DTO 테스트 중" + moviesByGenreDTOs.toString());
        List<BannerDTO> bannerDTOs = bannerService.DisplayBanner(genre);
        FundingPlusDTO fundingPlusDTO = new FundingPlusDTO(moviesByGenreDTOs, bannerDTOs);
        log.debug("펀딩플러스 테스트 중" + moviesByGenreDTOs.toString());
        return ResponseEntity.ok().body(ApiUtils.success(fundingPlusDTO.getMoviesByGenreDTOs()));
    }

}
