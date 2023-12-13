package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.BannerRepository;
import com.tenco.indiepicter.funding.response.MoviesByGenreDTO;
import com.tenco.indiepicter.funding.response.OnAirMovieDTO;
import com.tenco.indiepicter.funding.response.OnAirMovieRankingDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class FundingService {

    @Autowired
    private FundingRepository fundingRepository;

    public List<MoviesByGenreDTO> moviesByGenre(String genre, Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByGenre(genre, pageSize, offset);
    }

    public List<OnAirMovieDTO> onAirMovies(){
        return fundingRepository.findAllByOnAir();
    }

    public List<OnAirMovieRankingDTO> onAirRankedMovies(){
        return fundingRepository.findAllByOnAirAndRanking();
    }



}
