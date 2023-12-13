package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter.banner.Banner;
import lombok.Data;

@Data
public class BannerDTO {
    String bannerPic;
    Integer movieId;

    public BannerDTO(Banner banner) {
        this.bannerPic = banner.getBannerPic();
        this.movieId = banner.getMovieId();
    }
}