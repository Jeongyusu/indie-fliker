package com.tenco.indiepicter.review.normalreview;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewDeleteDTO;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewSaveDTO;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewUpdateDTO;
import com.tenco.indiepicter.review.normalreview.response.NormalReviewsToMovieDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class NormalReviewService {

    @Autowired
    private NormalReviewRepository normalReviewRepository;

    // 댓글 등록
    @Transactional
    public int saveToNormalReview(NormalReviewSaveDTO requestDTO, Integer principalId) {
        Review review = Review.builder()
                .content(requestDTO.getReviewContent())
                .movieId(requestDTO.getMovieId())
                .userId(principalId)
                .build();
        return normalReviewRepository.insert(review);
    }

    // 댓글 삭제
    @Transactional
    public int deleteToNormalReview(NormalReviewDeleteDTO requestDTO, Integer principalId) {
        Review review = normalReviewRepository.findByAllId(requestDTO.getNormalReviewId(), requestDTO.getMovieId(), principalId);
        if (review == null) {
            throw new MyDynamicException("댓글이 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
        }

        return normalReviewRepository.deleteById(review.getId());
    }

    // 댓글 수정
    @Transactional
    public int updateToNormalReview(NormalReviewUpdateDTO requestDTO, Integer principalId) {
        Review review = normalReviewRepository.findByAllId(requestDTO.getNormalReviewId(), requestDTO.getMovieId(), principalId);
        if (review == null) {
            throw new MyDynamicException("댓글이 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
        }
        return normalReviewRepository.updateById(requestDTO.getReviewContent(), review.getId());
    }

    // movie_id에 따른 댓글 목록
    public List<NormalReviewsToMovieDTO> findByReviews(Integer movieId){
        return normalReviewRepository.findByMovieId(movieId);
    };
}
