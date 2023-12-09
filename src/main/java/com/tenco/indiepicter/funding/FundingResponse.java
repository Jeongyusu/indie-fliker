package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.Banner;
import com.tenco.indiepicter.movie.Movie;
import lombok.Data;

import java.util.List;

public class FundingResponse {

    @Data
    public static class fundingPlusDTO{
        List<MoviesByGenreDTO> moviesByGenreDTOS;
        List<BannerDTO> banners;

        public fundingPlusDTO(List<MoviesByGenreDTO> moviesByGenreDTOS, List<BannerDTO> banners) {
            this.moviesByGenreDTOS = moviesByGenreDTOS;
            this.banners = banners;
        }

        @Data
        public class MoviesByGenreDTO {
            Integer movieId;
            String movieThumbnail;
            Integer fundingRate;
            String movieName;
            String synopsis;
            String  production;

            public MoviesByGenreDTO(Funding funding, Movie movie) {
                this.movieId = funding.getMovieId();
                this.movieThumbnail = movie.getThumbnail();
                this.fundingRate = Math.round((float)(funding.getPresentPrice() / funding.getTargetPrice())) ;
                this.movieName = movie.getMovieName();
                this.synopsis = movie.getSynopsis();
                this.production = movie.getProduction();
            }
        }

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
