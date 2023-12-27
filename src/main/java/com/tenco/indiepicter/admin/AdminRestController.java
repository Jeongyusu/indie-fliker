package com.tenco.indiepicter.admin;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.admin.response.AdminReviewResponseDTO;
import com.tenco.indiepicter.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;
import java.util.List;

@RestController
public class AdminRestController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private HttpSession session;

    // 댓글 삭제
//    @PostMapping("/api/delete/comment")
//    public ResponseEntity<?> deleteComment(@RequestBody AdminReviewResponseDTO.DeleteCommentRequest request) {
//        adminService.deleteComment(request.getCommentId());
//        return ResponseEntity.ok().body(ApiUtils.success(null));
//    }

    // 댓글 조회
    @GetMapping("/user/comment")
    public String getUserComments(@RequestParam int userId, @RequestParam int movieId, Model model) {
        List<Comment> userMovieComments = adminService.getCommentsByUserId(userId, movieId);
        model.addAttribute("userMovieComments", userMovieComments);
        return "manager/review";
    }

}