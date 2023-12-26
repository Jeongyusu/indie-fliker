package com.tenco.indiepicter.movie.moviefile;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieFileRepository {

    public int deleteAllByMovieId(Integer movieId);
}
