package com.tenco.indiepicter.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminFundingController {

    // 펀딩 등록 / 삭제 페이지 호출
    @GetMapping("/funding-management")
    public String funding(Model model) {

        return "manager/update_delete";
    }
}
