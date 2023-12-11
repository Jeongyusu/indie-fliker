package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.BannerService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class FundingController {

    @Autowired
    private FundingService fundingService;

    @Autowired
    private BannerService bannerService;
    @GetMapping("/funding-plus")
    public String fundingPlus (@RequestParam(name = "genre", defaultValue = "극영화") String genre, @RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        List<FundingResponse.FundingPlusDTO.MoviesByGenreDTO> moviesByGenreDTOs = fundingService.MoviesByGenre(genre, page, 5);
        List<FundingResponse.FundingPlusDTO.BannerDTO> bannerDTOs = bannerService.DisplayBanner(genre);
        FundingResponse.FundingPlusDTO fundingPlusDTO = new FundingResponse.FundingPlusDTO(moviesByGenreDTOs, bannerDTOs);
        model.addAttribute("fundingPlusDTO", fundingPlusDTO);
        return "main/movielist";
    }
}
