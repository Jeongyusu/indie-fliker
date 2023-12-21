package com.tenco.indiepicter.funding.fundingready;

import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter._core.utils.Script;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.FundingDetailDTO;
import com.tenco.indiepicter.funding.response.FundingReadyDetailDTO;
import com.tenco.indiepicter.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/funding-ready")
@Controller
public class FundingReadyController {

    @Autowired
    private FundingReadyService fundingReadyService;

    @PostMapping("/save")
    public @ResponseBody String saveFunding(FundingSaveDTO requestDTO){
        fundingReadyService.saveFundingReady(requestDTO);
        return Script.href("/fund/funding-plus", "펀딩 등록 성공! 심사 후 승인됩니다.");
    }

    @GetMapping("/{id}")
    public String detailFunding(@PathVariable Integer id, Model model){
        FundingReadyDetailDTO fundingDetailDTO = fundingReadyService.detailFunding(id);
        model.addAttribute("fundingDetailDTO", fundingDetailDTO);
        return "manager/funding_ready_preview";
    }
}
