package com.tenco.indiepicter.movie.moviephoto;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MoviePhotoRepository {

    // moviePhoto 조회
    public List<MoviePhoto> findByMovieId(Integer movieId);
}
