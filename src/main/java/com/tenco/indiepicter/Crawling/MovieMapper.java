package com.tenco.indiepicter.Crawling;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MovieMapper {

    void insertMovie(MovieCrawl movieCrawl);

    Integer countMovies(MovieCrawl movieCrawl);


}
