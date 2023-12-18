package com.tenco.indiepicter.review.vipreview;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.review.normalreview.Review;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewDeleteDTO;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewUpdateDTO;
import com.tenco.indiepicter.review.normalreview.response.NormalReviewsToMovieDTO;
import com.tenco.indiepicter.review.vipreview.request.VipReviewDeleteDTO;
import com.tenco.indiepicter.review.vipreview.request.VipReviewSaveDTO;
import com.tenco.indiepicter.review.vipreview.request.VipReviewUpdateDTO;
import com.tenco.indiepicter.review.vipreview.response.VipReviewsToMovieDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class VipReviewService {

    @Autowired
    private VipReviewRepository vipReviewRepository;

    // vip 평론 등록
    @Transactional
    public int saveToVipReview(VipReviewSaveDTO requestDTO, Integer principalId) {
        VipReview vipReview = VipReview.builder()
                .point(requestDTO.getVipReviewPoint())
                .content(requestDTO.getVipReviewContent())
                .movieId(requestDTO.getMovieId())
                .userId(principalId)
                .build();
        return vipReviewRepository.insert(vipReview);
    }

    // vip 평론 삭제
    @Transactional
    public int deleteToVipReview(VipReviewDeleteDTO requestDTO, Integer principalId) {
        VipReview vipReview = vipReviewRepository.findByUserIdAndMovieId(requestDTO.getMovieId(), principalId);
        if (vipReview == null) {
            throw new MyDynamicException("댓글이 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
        }

        return vipReviewRepository.deleteById(vipReview.getId());
    }

    // vip 평론 수정
    @Transactional
    public int updateToVipReview(VipReviewUpdateDTO requestDTO, Integer principalId) {
        VipReview vipReview = vipReviewRepository.findByUserIdAndMovieId(requestDTO.getMovieId(), principalId);
        if (vipReview == null) {
            throw new MyDynamicException("댓글이 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
        }
        return vipReviewRepository.updateById(requestDTO.getVipReviewContent(), requestDTO.getVipReviewPoint(), vipReview.getId());
    }

    // movie_id에 따른 vip 평론 목록
    public List<VipReviewsToMovieDTO> findByVipReviews(Integer movieId){
        return vipReviewRepository.findByMovieId(movieId);
    };
}
