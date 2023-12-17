package com.tenco.indiepicter.movie;

import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Year;

@Service
public class MovieService {

    @Autowired
    MovieRepository movieRepository;
    public int saveMovie(FundingSaveDTO fundingSaveDTO){
        Movie movie = Movie.builder()
                .makeYear(Year.now().getValue())
                .production("(주)인디픽터")
                .movieName(fundingSaveDTO.getMovieTitle())
                .synopsis(fundingSaveDTO.getSynopsis())
//                .thumbnail(fundingSaveDTO.getMovieThumbnail())
                .directingIntension(fundingSaveDTO.getDirectingIntension())
                .genre("ㅇㅇ")
                .build();
        return movieRepository.saveMovie(movie);
    }
}
