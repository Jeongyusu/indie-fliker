package com.tenco.indiepicter.crawling;


import com.tenco.indiepicter.movie.Movie;
import com.tenco.indiepicter.movie.moviephoto.MoviePhoto;
import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MovieCrawlRepository {

    // 무비 테이블
    void insertMovie(Movie movie);

    // 스태프
    void insertMovieStaff(MovieStaff movieStaff);

    // 포토
    void insertMoviePhoto(MoviePhoto moviePhoto);

    // 중복 데이터 방지
    Integer countMovies(MovieCrawl movieCrawl);




}
