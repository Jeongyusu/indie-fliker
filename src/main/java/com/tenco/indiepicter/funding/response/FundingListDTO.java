package com.tenco.indiepicter.funding.response;

import lombok.Data;

import java.util.List;

@Data
public class FundingListDTO {

    List<FundingDTO> fundingDTOs;
    List<BannerDTO> banners;

    public FundingListDTO(List<FundingDTO> fundingDTOs , List<BannerDTO> banners) {
        this.fundingDTOs = fundingDTOs;
        this.banners = banners;
    }
}
