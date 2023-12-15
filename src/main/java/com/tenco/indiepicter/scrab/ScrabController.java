package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter.scrab.response.ScrabDTO;
import com.tenco.indiepicter.scrab.response.ScrabResponseDTO;
import com.tenco.indiepicter.user.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.List;

@Slf4j
@Controller
public class ScrabController {

    @Autowired
    private ScrabService scrabService;

    @Autowired
    private UserService userService;

//    @GetMapping("/like-list")
//    public String likeList(Model model, Principal principal) {
////         현재 로그인한 사용자의 ID를 가져옴
//        String username = principal.getName();
//        Integer userId = userService.findUserIdByUsername(username);
//
//        // 좋아요 목록을 가져오는 서비스 호출
//        List<ScrabDTO> scrabDTOList = scrabService.LikeList(userId);
//        model.addAttribute("scrabDTO", scrabDTOList);
//
//        return "mypage/likelist";
//    }

}
