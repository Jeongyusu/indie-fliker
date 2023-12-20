package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter._core.utils.Script;
import com.tenco.indiepicter.banner.BannerService;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.*;
import com.tenco.indiepicter.movie.MovieService;
import com.tenco.indiepicter.movie.moviestaff.MovieStaffService;
import com.tenco.indiepicter.scrab.ScrabService;
import com.tenco.indiepicter.theater.TheaterService;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/fund")
public class FundingController {
    @Autowired
    private HttpSession session;

    @Autowired
    private FundingService fundingService;

    @Autowired
    private BannerService bannerService;

    @Autowired
    private TheaterService theaterService;

    @Autowired
    private ScrabService scrabService;

    @Autowired
    private MovieService movieService;

    @Autowired
    private MovieStaffService movieStaffService;

    @GetMapping("/funding-plus")
    public String fundingPlus (@RequestParam(name = "genre", defaultValue = "극영화") String genre, @RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        List<MoviesByGenreDTO> moviesByGenreDTOs = fundingService.moviesByGenre(genre, page, 5);
        List<BannerDTO> bannerDTOs = bannerService.DisplayBanner(genre);
        FundingPlusDTO fundingPlusDTO = new FundingPlusDTO(moviesByGenreDTOs, bannerDTOs);
        model.addAttribute("fundingPlusDTO", fundingPlusDTO);
        return "main/movielist";
    }

    @GetMapping("/on-air")
    public String onAirMovies(Model model){
        OnAirTotalDTO onAirTotalDTO = new OnAirTotalDTO(fundingService.onAirMovies(), fundingService.onAirRankedMovies(), theaterService.mainPageTheaters());
        model.addAttribute("onAirTotalDTO", onAirTotalDTO);
        return "main/main";
    }

    @GetMapping("/funding/{id}")
    public String detailFunding(@PathVariable Integer id, Model model){
        FundingDetailDTO fundingDetailDTO = fundingService.detailFunding(id);
        boolean isLiked = scrabService.checkIsLiked(1, id); // 추후 1을 sessionUser.getId()로 변경
        fundingDetailDTO.setLiked(isLiked);
        model.addAttribute("fundingDetailDTO", fundingDetailDTO);
        log.debug("==============================");
        log.debug(fundingDetailDTO.toString());
        return "fund/on_detail";
    }

    @GetMapping("/offline-movie/{id}")
    public String detailOfflineMovie(@PathVariable Integer id, Model model){
        OfflineMovieDetailDTO offlineMovieDetailDTO = fundingService.detailOfflineMovie(id);
        model.addAttribute("offlineMovieDetailDTO", offlineMovieDetailDTO);
        return "fund/off_detail";
    }

    @GetMapping("/saveForm")
    public String fundingSaveForm(){
        return "fund/fund_upload";
    }


    @GetMapping("/search")
    public String searchFunding(@RequestParam( name ="keyword") String keyword, Model model){
        List<SearchResultDTO> searchResultDTOs = fundingService.searchKeyword(keyword);
        model.addAttribute("searchResultDTOs", searchResultDTOs);
        return "main/search_result";
    }

    @PostMapping("/save")
    public @ResponseBody String saveFunding(FundingSaveDTO requestDTO){
        fundingService.saveFunding(requestDTO);
        return Script.href("/fund/funding-plus", "펀딩 등록 성공! 심사 후 승인됩니다.");
    }
}
