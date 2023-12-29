package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.banner.BannerService;
import com.tenco.indiepicter.funding.response.*;
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
    public ResponseEntity<?> fundingPlus(@RequestParam(name="genre", defaultValue = "") String genre, @RequestParam(name="page", defaultValue = "1") Integer page) {
        if(genre.isEmpty()){
            List<FundingDTO> moviesByMainDTOs = fundingService.moviesByMain(page, 5);
            System.out.println("api 장르 있음");
            return ResponseEntity.ok().body(ApiUtils.success(moviesByMainDTOs));
        }

        List<FundingDTO> moviesByGenreDTOs = fundingService.moviesByGenre(genre, page, 5);
        System.out.println("api 장르 없음");
        return ResponseEntity.ok().body(ApiUtils.success(moviesByGenreDTOs));

    }

    // 온라인 영화 페이징
    @GetMapping ("/api/on-movies")
    public ResponseEntity<?> onlineMoviePlus(@RequestParam(name="page", defaultValue = "1") Integer page) {
        List<OnAirMoviePageDTO> onAirMoviePageDTOs = fundingService.onAirMoviePage(page, 20);
        return ResponseEntity.ok().body(ApiUtils.success(onAirMoviePageDTOs));
    }

    // 오프라인 영화 페이징
    @GetMapping ("/api/off-movies")
    public ResponseEntity<?> offlineMoviePlus(@RequestParam(name="page", defaultValue = "1") Integer page) {
        List<OffAirMoviePageDTO> offAirMoviePageDTOs = fundingService.offAirMoviePage(page, 12);
        return ResponseEntity.ok().body(ApiUtils.success(offAirMoviePageDTOs));
    }

    // 온라인 개봉 예정 영화 페이징
    @GetMapping ("/api/to-be-open-movies")
    public ResponseEntity<?> toBeOpenMoviePlus(@RequestParam(name="page", defaultValue = "1") Integer page) {
        List<OnDDayMovieDTO> onDDayMovieDTOs = fundingService.onDDayMovies(page, 15);
        return ResponseEntity.ok().body(ApiUtils.success(onDDayMovieDTOs));
    }

}
