package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.Banner;
import com.tenco.indiepicter.movie.Movie;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

public class FundingResponse {

    @Data
    public static class FundingPlusDTO{
        List<MoviesByGenreDTO> moviesByGenreDTOS;
        List<BannerDTO> banners;

        public FundingPlusDTO(List<MoviesByGenreDTO> moviesByGenreDTOs ,List<BannerDTO> banners) {
            this.moviesByGenreDTOS = moviesByGenreDTOs;
            this.banners = banners;
        }
        @Data
        public static class MoviesByGenreDTO {
            Integer movieId;
            String movieThumbnail;
            Integer fundingRate;
            String movieName;
            String synopsis;
            String  production;
        }
        @Data
        public static class BannerDTO {
            String bannerPic;
            Integer movieId;

            public BannerDTO(Banner banner) {
                this.bannerPic = banner.getBannerPic();
                this.movieId = banner.getMovieId();
            }
        }

    }

}
