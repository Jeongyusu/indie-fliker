package com.tenco.indiepicter.review.normalreview;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewDeleteDTO;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewSaveDTO;
import com.tenco.indiepicter.review.normalreview.request.NormalReviewUpdateDTO;
import com.tenco.indiepicter.review.normalreview.response.NormalReviewsToMovieDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/normal-review")
public class NormalReviewRestController {

    @Autowired
    private NormalReviewService normalReviewService;

    @Autowired
    private HttpSession session;


    // 댓글 등록(POST)
    @PostMapping("/api/save")
    public ResponseEntity<?> saveToNormalReview(@RequestBody NormalReviewSaveDTO normalReviewSaveDTO) {
//        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        System.out.println("여기아다다다!!!!!!!!!1" + normalReviewSaveDTO.getReviewContent());
        System.out.println("여기아다다다!!!!!!!!!1" + normalReviewSaveDTO.getMovieId());
        int rowResultCount = normalReviewService.saveToNormalReview(normalReviewSaveDTO, 1);
        return ResponseEntity.ok().body(ApiUtils.success(rowResultCount));
    }

    // 댓글 삭제(POST)
    @PostMapping("/api/delete")
    public ResponseEntity<?> deleteToNormalReview(@RequestBody NormalReviewDeleteDTO normalReviewDeleteDTO) {
//        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        int rowResultCount = normalReviewService.deleteToNormalReview(normalReviewDeleteDTO, 1);
        return ResponseEntity.ok().body(ApiUtils.success(rowResultCount));
    }

    // 댓글 수정(POST)
    @PostMapping("/api/update")
    public ResponseEntity<?> updateToNormalReview(@RequestBody NormalReviewUpdateDTO normalReviewUpdateDTO) {
//        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        int rowResultCount = normalReviewService.updateToNormalReview(normalReviewUpdateDTO, 1);
        return ResponseEntity.ok().body(ApiUtils.success(rowResultCount));
    }

    // movie_id로 댓글 목록(GET)
    @GetMapping("/api/{movieId}/list")
    public ResponseEntity<?> findToNormalReviews(@PathVariable Integer movieId) {
//        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        List<NormalReviewsToMovieDTO> normalReviewsToMovieDTOS = normalReviewService.findByReviews(movieId);
        return ResponseEntity.ok().body(ApiUtils.success(normalReviewsToMovieDTOS));
    }}




