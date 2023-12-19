package com.tenco.indiepicter.movie.moviephoto;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MoviePhotoRepository {
    // moviephoto 등록
    public int saveMoviePhoto(MoviePhoto moviePhoto);

    // moviePhoto 조회
    public List<MoviePhoto> findByMovieId(Integer movieId);

}
