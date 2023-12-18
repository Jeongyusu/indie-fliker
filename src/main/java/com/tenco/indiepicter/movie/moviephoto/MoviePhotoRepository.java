package com.tenco.indiepicter.movie.moviephoto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MoviePhotoRepository {
    public int saveMoviePhoto(MoviePhoto moviePhoto);
}
