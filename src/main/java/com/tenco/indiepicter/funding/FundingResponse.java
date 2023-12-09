package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.movie.Movie;
import lombok.Data;

import java.util.List;

public class FundingResponse {

    @Data
    public static class fundingPlusDTO{
        List<MoviesByGenreDTO> moviesByGenreDTOS;
        List<Banner> banners;

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

        public static class Banner {
            String bannerPic;
            Integer movieId;

            public Banner(String bannerPic, Integer movieId) {
                this.bannerPic = bannerPic;
                this.movieId = movieId;
            }
        }
    }

}
