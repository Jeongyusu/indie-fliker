package com.tenco.indiepicter.admin.funding;

import com.tenco.indiepicter.funding.FundingService;
import com.tenco.indiepicter.funding.fundingready.FundingReady;
import com.tenco.indiepicter.funding.fundingready.FundingReadyService;
import com.tenco.indiepicter.funding.response.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
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
        List<AdminFundingModifyDTO> adminFundingModifyDTOs = fundingService.findAllAdminFundingModify();
        model.addAttribute("adminFundingModifyDTOs", adminFundingModifyDTOs);
        return "manager/update_delete";
    }

    @GetMapping("/funding-ready-list")
    public String authorizationSave(@RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        List<FundingReadyDTO> fundingReadyDTOs = fundingReadyService.findAllFundingReady(page, 8);
        model.addAttribute("fundingReadyDTOs", fundingReadyDTOs);
        return "manager/register";
    }

    @GetMapping("/funding/{id}/updateForm")
    public String fundingUpdateForm(@PathVariable Integer id, Model model){

//        model.addAttribute()
        return "manager/funding_modify";
    }

    @GetMapping("/funding-period-set")
    public String fundingPlayDay(Model model){
        List<AdminOnlineStreamingDTO> adminOnlineStreamingDTOs = fundingService.findAllAdminPeriodSetting();
        log.debug("==============================");
        log.debug(adminOnlineStreamingDTOs.toString());
        model.addAttribute("adminOnlineStreamingDTOs", adminOnlineStreamingDTOs);
        return "manager/playday";
    }

    // TODO : 남 - 확인(온라인 상영일자 등록)
    @GetMapping("/chatting2")
    public String chatting1(Model model){
        List<AdminOnFundingListDTO> adminOnFundingListDTOs = fundingService.findAllAdminFundingList();
        model.addAttribute("adminOnFundingListDTOs", adminOnFundingListDTOs);
        return "manager/chatting3";
    }

}
