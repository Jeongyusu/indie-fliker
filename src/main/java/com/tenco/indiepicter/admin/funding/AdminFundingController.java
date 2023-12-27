package com.tenco.indiepicter.admin.funding;

import com.tenco.indiepicter._core.utils.Script;
import com.tenco.indiepicter.funding.FundingService;
import com.tenco.indiepicter.funding.fundingready.FundingReadyService;
import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
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
        AdminFundingUpdateFormDTO adminFundingUpdateFormDTO = fundingService.findByIdForAdminFundingModify(id);
        log.debug("=======수정폼 정보조회=========");
        log.debug(adminFundingUpdateFormDTO.toString());
        log.debug("=======수정폼 포토 출력=========");
        log.debug("사이즈" + adminFundingUpdateFormDTO.splitStringToList(adminFundingUpdateFormDTO.getMoviePhotos()).size());
        model.addAttribute("adminFundingUpdateFormDTO", adminFundingUpdateFormDTO);
        return "manager/funding_modify";
    }

    @GetMapping("/funding/movie-open/setting")
    public String moviePlayDay(Model model){
        List<AdminOnlineStreamingDTO> adminOnlineStreamingDTOs = fundingService.findAllAdminPeriodSetting();
        log.debug("==============================");
        log.debug(adminOnlineStreamingDTOs.toString());
        model.addAttribute("adminOnlineStreamingDTOs", adminOnlineStreamingDTOs);
        return "manager/playday";
    }

    @GetMapping("/funding/off-movie-open/setting")
    public String offMoviePlayDay(Model model){
        List<AdminOfflineStreamingDTO> adminOfflineStreamingDTOs = fundingService.findAllAdminOfflinePeriodSetting();
        log.debug("==============================");
        log.debug(adminOfflineStreamingDTOs.toString());
        model.addAttribute("adminOfflineStreamingDTOs", adminOfflineStreamingDTOs);
        return "manager/playoffday";
    }

    @PostMapping("/funding/update")
    public @ResponseBody String saveFunding(AdminRequestFundingUpdateFormDTO adminRequestFundingUpdateFormDTO){
        fundingService.updateById(adminRequestFundingUpdateFormDTO);
        return Script.href("/admin/funding-management", "펀딩 업데이트 성공!");
    }

    @GetMapping("/funding-management/search")
    public String searchFunding(@RequestParam( name ="keyword") String keyword, Model model){
        List<AdminFundingManagementSearchDTO> searchResultDTOs = fundingService.findAllAdminFundingModifySearch(keyword);
        model.addAttribute("searchResultDTOs", searchResultDTOs);
        return "manager/update_delete_search";
    }


    @GetMapping("/funding-ready-list/search")
    public String searchReadyList(@RequestParam( name ="keyword") String keyword, Model model){
        List<SearchFundingReadyDTO> searchResultDTOs = fundingReadyService.searchFundingReady(keyword);
        model.addAttribute("searchResultDTOs", searchResultDTOs);
        return "manager/register_search";
    }

}
