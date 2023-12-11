package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.BannerService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/funding")
public class FundingController {

    @Autowired
    private FundingService fundingService;

    @Autowired
    private BannerService bannerService;
    @GetMapping("/funding-plus/{genre}")
    public String fundingPlus (@PathVariable String genre, Module model){
//        List<FundingResponse.FundingPlusDTO.MoviesByGenreDTO> moviesByGenreDTOs = fundingService.MoviesByGenre(genre);
//        List<FundingResponse.FundingPlusDTO.BannerDTO> bannerDTOs = bannerService.DisplayBanner(genre);
        return null;
    }
}
