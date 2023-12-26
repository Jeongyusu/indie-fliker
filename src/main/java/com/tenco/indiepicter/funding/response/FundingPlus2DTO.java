package com.tenco.indiepicter.funding.response;

import lombok.Data;

import java.util.List;

@Data
public class FundingPlus2DTO {
    List<MoviesByMainDTO> moviesByMainDTOs;
    List<BannerDTO> banners;

    public FundingPlus2DTO(List<MoviesByMainDTO> moviesByMainDTOs , List<BannerDTO> banners) {
        this.moviesByMainDTOs = moviesByMainDTOs;
        this.banners = banners;
    }



}