package com.tenco.indiepicter.admin;

import com.tenco.indiepicter.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.stream.events.Comment;
import java.util.List;

@RestController
public class AdminRestController {
    @Autowired
    private AdminService adminService;

    @PostMapping("/api/delete/comment")
    public String deleteComment(User userId) {
        int commentIdToDelete = userId.getId();
        adminService.deleteComment(commentIdToDelete);

        return "redirect:/admin/review";
    }
    @GetMapping("/user/{userId}")
    public String getUserComments(@PathVariable int userId, Model model) {
        List<Comment> userComments = adminService.getCommentsByUserId(userId);
        model.addAttribute("userComments", userComments);
        return null;
    }
}