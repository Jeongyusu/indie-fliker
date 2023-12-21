package com.tenco.indiepicter.admin.funding;

import com.tenco.indiepicter.funding.FundingService;
import com.tenco.indiepicter.funding.fundingready.FundingReady;
import com.tenco.indiepicter.funding.fundingready.FundingReadyService;
import com.tenco.indiepicter.funding.response.FundingReadyDTO;
import com.tenco.indiepicter.funding.response.FundingReadyDetailDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/admin")
@Controller
public class AdminFundingController {

    @Autowired
    private FundingService fundingService;

    @Autowired
    private FundingReadyService fundingReadyService;

    // 펀딩 등록 / 삭제 페이지 호출
    @GetMapping("/funding-management")
    public String funding(Model model) {

        return "manager/update_delete";
    }

    @GetMapping("/funding-ready-list")
    public String authorizationSave(@RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        List<FundingReadyDTO> fundingReadyDTOs = fundingReadyService.findAllFundingReady(page, 8);
        model.addAttribute("fundingReadyDTOs", fundingReadyDTOs);
        return "manager/register";
    }




}
