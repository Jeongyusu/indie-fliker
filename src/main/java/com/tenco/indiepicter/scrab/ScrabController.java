package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.scrab.response.ScrabResponseDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/scrab")
public class ScrabController {

    @Autowired
    private ScrabService scrabService;

    // 좋아요 기능
    @PostMapping("/like-list")
    public String likeList(@ModelAttribute Scrab scrab) {
        boolean scrabs = scrabService.toggleScrab(scrab.getUserId(), scrab.getFundingId());
        return "redirect:/my-likelist";
    }

    // 좋아요 목록보기
    @GetMapping("/my-likelist")
    public String likelist(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(Define.PRINCIPAL);
        List<ScrabResponseDTO> scrabDTOs = scrabService.scrabview(user.getId());
        model.addAttribute("scrabDTOs", scrabDTOs);
        return "mypage/likelist";
    }


}
