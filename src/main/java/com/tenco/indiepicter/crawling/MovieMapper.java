package com.tenco.indiepicter.crawling;


import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface MovieMapper {

    void insertMovie(MovieCrawl movieCrawl);

    void insertMovieStaff(MovieCrawl movieCrawl);

    void insertMoviePhoto(MovieCrawl movieCrawl);

    Integer countMovies(MovieCrawl movieCrawl);


}
