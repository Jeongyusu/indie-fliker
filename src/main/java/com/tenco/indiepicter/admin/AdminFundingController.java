package com.tenco.indiepicter.admin;

import com.tenco.indiepicter.funding.FundingService;
import com.tenco.indiepicter.funding.response.FundingReadyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminFundingController {

    @Autowired
    private FundingService fundingService;

    // 펀딩 등록 / 삭제 페이지 호출
    @GetMapping("/funding-management")
    public String funding(Model model) {

        return "manager/update_delete";
    }

    @GetMapping("/funding/register")
    public String authorizationSave(@RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        List<FundingReadyDTO> fundingReadyDTOs = fundingService.findAllFundingReady(page, 8);
        model.addAttribute("fundingReadyDTOs", fundingReadyDTOs);
        return "manager/register";
    }
}
