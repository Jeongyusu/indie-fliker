package com.tenco.indiepicter.review.normalreview;

import com.tenco.indiepicter.review.normalreview.response.NormalReviewsToMovieDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NormalReviewRepository {

    // 댓글 등록
    public int insert(Review review);

    // 댓글 삭제
    public int deleteById(Integer normalReviewId);

    // 댓글 수정
    public int updateById(@Param("content")String content, @Param("normalReviewId")Integer normalReviewId);

    // 댓글 전체 조회
    public List<Review> findAll();

    // movie_id로 댓글 조회
    public List<NormalReviewsToMovieDTO> findByMovieId(Integer movieId);

    // user_id, movie_id로 댓글 조회
    public List<Review> findByUserIdAndMovieId(@Param("movieId") Integer movieId, @Param("principalId") Integer principalId);

    // user_id, movie_id, id로 1개 댓글 조회
    public Review findByAllId(@Param("normalReviewId") Integer normalReviewId,@Param("movieId") Integer movieId, @Param("principalId") Integer principalId);}
