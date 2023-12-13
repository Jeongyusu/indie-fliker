package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.BannerService;
import com.tenco.indiepicter.funding.response.BannerDTO;
import com.tenco.indiepicter.funding.response.FundingPlusDTO;
import com.tenco.indiepicter.funding.response.MoviesByGenreDTO;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
public class FundingController {

    @Autowired
    private FundingService fundingService;

    @Autowired
    private BannerService bannerService;
    @GetMapping("/funding-plus")
    public String fundingPlus (@RequestParam(name = "genre", defaultValue = "극영화") String genre, @RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        List<MoviesByGenreDTO> moviesByGenreDTOs = fundingService.MoviesByGenre(genre, page, 5);
        log.debug("무비장르DTO 테스트 중" + moviesByGenreDTOs.toString());
        List<BannerDTO> bannerDTOs = bannerService.DisplayBanner(genre);
        FundingPlusDTO fundingPlusDTO = new FundingPlusDTO(moviesByGenreDTOs, bannerDTOs);
        model.addAttribute("fundingPlusDTO", fundingPlusDTO);
        log.debug("펀딩플러스 테스트 중" + moviesByGenreDTOs.toString());
        return "main/movielist";
    }

    @GetMapping("/on-air")
    public String onAirMoives(){
        return "main/main";
    }
}
