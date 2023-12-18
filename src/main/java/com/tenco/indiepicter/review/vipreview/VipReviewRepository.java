package com.tenco.indiepicter.review.vipreview;

import com.tenco.indiepicter.review.normalreview.Review;
import com.tenco.indiepicter.seat.Seat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface VipReviewRepository {

    // vip 평론 등록
    public int insert(VipReview vipReview);

    // vip 평론 삭제
    public int deleteById(Integer vipReviewId);

    // vip 평론 수정
    public int updateById(@Param("content") String content, @Param("point") Integer point, @Param("vipReviewId") Integer vipReviewId);

    // vip 평론 전체 조회
    public List<VipReview> findAll();

    // movie_id로 vip 평론 조회
    public List<VipReview> findByMovieId(Integer movieId);

    // user_id, movie_id로 vip 평론 조회 - 1개 제한
    public VipReview findByUserIdAndMovieId(@Param("movieId") Integer movieId, @Param("principalId") Integer principalId);
}
