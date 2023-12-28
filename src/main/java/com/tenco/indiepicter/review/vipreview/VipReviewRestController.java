package com.tenco.indiepicter.review.vipreview;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.review.vipreview.request.VipReviewDeleteDTO;
import com.tenco.indiepicter.review.vipreview.request.VipReviewSaveDTO;
import com.tenco.indiepicter.review.vipreview.request.VipReviewUpdateDTO;
import com.tenco.indiepicter.review.vipreview.response.VipReviewsToMovieDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/vip-review")
public class VipReviewRestController {

    @Autowired
    private VipReviewService vipReviewService;

    @Autowired
    private HttpSession session;


    // 댓글 등록(POST)
    @PostMapping("/api/save")
    public ResponseEntity<?> saveToVipReview(@RequestBody VipReviewSaveDTO VipReviewSaveDTO) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        int rowResultCount = vipReviewService.saveToVipReview(VipReviewSaveDTO, principal.getId());
        return ResponseEntity.ok().body(ApiUtils.success(rowResultCount));
    }

    // 댓글 삭제(POST)
    @PostMapping("/api/delete")
    public ResponseEntity<?> deleteToVipReview(@RequestBody VipReviewDeleteDTO VipReviewDeleteDTO) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        int rowResultCount = vipReviewService.deleteToVipReview(VipReviewDeleteDTO, principal.getId());
        return ResponseEntity.ok().body(ApiUtils.success(rowResultCount));
    }

    // 댓글 수정(POST)
    @PostMapping("/api/update")
    public ResponseEntity<?> updateToVipReview(@RequestBody VipReviewUpdateDTO VipReviewUpdateDTO) {
        User principal = (User) session.getAttribute(Define.PRINCIPAL);
        int rowResultCount = vipReviewService.updateToVipReview(VipReviewUpdateDTO, principal.getId());
        return ResponseEntity.ok().body(ApiUtils.success(rowResultCount));
    }

    // movie_id로 댓글 목록(GET)
    @GetMapping("/api/{movieId}/list")
    public ResponseEntity<?> findToVipReviews(@PathVariable Integer movieId) {
        List<VipReviewsToMovieDTO> VipReviewsToMovieDTOs = vipReviewService.findByVipReviews(movieId);
        return ResponseEntity.ok().body(ApiUtils.success(VipReviewsToMovieDTOs));
    }}




