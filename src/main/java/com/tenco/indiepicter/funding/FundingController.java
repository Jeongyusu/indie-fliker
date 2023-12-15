package com.tenco.indiepicter.funding;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.banner.BannerService;
import com.tenco.indiepicter.funding.response.*;
import com.tenco.indiepicter.scrab.ScrabService;
import com.tenco.indiepicter.theater.TheaterService;
import com.tenco.indiepicter.user.User;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
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
        User sessionUser = (User) session.getAttribute(Define.PRINCIPAL);
        FundingDetailDTO fundingDetailDTO = fundingService.detailFunding(id);
        boolean isLiked = scrabService.checkIsLiked(1, id); // 추후 1을 sessionUser.getId()로 변경
        fundingDetailDTO.setLiked(isLiked);
        model.addAttribute("fundingDetailDTO", fundingDetailDTO);
        return "fund/on_detail";
    }

    @GetMapping("/offline-movie/{id}")
    public String detailOfflineMovie(@PathVariable Integer id, Model model){
        OfflineMovieDetailDTO offlineMovieDetailDTO = fundingService.detailOfflineMovie(id);
        model.addAttribute("offlineMovieDetailDTO", offlineMovieDetailDTO);
        return "fund/off_detail";
    }

    @PostMapping ("/funding/save")
    public String saveFunding(){
        return null;
    }
}
