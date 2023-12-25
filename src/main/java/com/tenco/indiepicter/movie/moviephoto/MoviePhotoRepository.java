package com.tenco.indiepicter.movie.moviephoto;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MoviePhotoRepository {
    // moviephoto 등록
    public int saveMoviePhoto(MoviePhoto moviePhoto);

    // moviePhoto 조회
    public List<MoviePhoto> findByMovieId(Integer movieId);

    // 어드민페이지 영화 포토 업데이트
    public int updateById(MoviePhoto moviePhoto);
}
