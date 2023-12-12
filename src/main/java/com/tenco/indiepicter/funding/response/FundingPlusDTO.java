package com.tenco.indiepicter.funding.response;

import lombok.Data;

import java.util.List;

@Data
public class FundingPlusDTO{
    List<MoviesByGenreDTO> moviesByGenreDTOs;
    List<BannerDTO> banners;

    public FundingPlusDTO(List<MoviesByGenreDTO> moviesByGenreDTOs ,List<BannerDTO> banners) {
        this.moviesByGenreDTOs = moviesByGenreDTOs;
        this.banners = banners;
    }



}