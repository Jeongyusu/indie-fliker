package com.tenco.indiepicter.admin.funding;

import com.tenco.indiepicter._core.utils.Script;
import com.tenco.indiepicter.funding.FundingService;
import com.tenco.indiepicter.funding.fundingready.FundingReadyService;
import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.response.*;
import com.tenco.indiepicter.scrab.ScrabService;
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

    @Autowired
    private ScrabService scrabService;


    // 펀딩 등록 / 삭제 페이지 호출
    @GetMapping("/funding-management")
    public String funding(@RequestParam(name="page", defaultValue = "1") Integer page ,Model model) {
        List<AdminFundingModifyDTO> adminFundingModifyDTOs = fundingService.findAllAdminFundingModify(page, 8);
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
        return Script.href("/admin/funding/detail/" + adminRequestFundingUpdateFormDTO.getFundingId(),"펀딩 업데이트 성공!");
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

    @GetMapping("/movie-open-setting/search")
    public String movieOpenSettingSearch(@RequestParam( name ="keyword") String keyword, Model model){
        List<AdminOnlineStreamingSearchDTO> searchResultDTOs = fundingService.searchKeywordAboutOnlineStreaming(keyword);
        model.addAttribute("searchResultDTOs", searchResultDTOs);
        return "manager/playday_search";
    }

    @GetMapping("/off-movie-open-setting/search")
    public String offMovieOpenSettingSearch(@RequestParam( name ="keyword") String keyword, Model model){
        List<AdminOfflineStreamingSearchDTO> searchResultDTOs = fundingService.searchKeywordAboutOfflineStreaming(keyword);
        model.addAttribute("searchResultDTOs", searchResultDTOs);
        return "manager/playoffday_search";
    }

    @GetMapping("/funding/confirm")
    public String fundingConfirm(@RequestParam(name = "page", defaultValue = "1") Integer page, Model model){
        List<AdminFundingProceedingDTO> adminFundingProceedingDTOs = fundingService.findAllAboutFundingProceeding(page, 10);
        model.addAttribute("adminFundingProceedingDTOs", adminFundingProceedingDTOs);
        return "manager/check";
    }

    @GetMapping("/funding/detail/{id}")
    public String detailFunding(@PathVariable Integer id, Model model){
        FundingDetailDTO fundingDetailDTO = fundingService.detailFunding(id);
        boolean isLiked = scrabService.checkIsLiked(1, id); // 추후 1을 sessionUser.getId()로 변경
        List<FundingDTO> moviesByMainDTOs = fundingService.moviesByMain(1, 10);

        model.addAttribute("fundingDetailDTO", fundingDetailDTO);
        model.addAttribute("moviesByMainDTOs", moviesByMainDTOs);
        model.addAttribute("isLiked", isLiked);
        return "manager/funding_ready_preview";
    }

    @GetMapping("/funding/confirm/search")
    public String fundingConfirmSearch(@RequestParam( name ="keyword") String keyword, Model model){
        List<AdminFundingProceedingSearchDTO> searchResultDTOs = fundingService.searchKeywordAboutFundingProceeding(keyword);
        model.addAttribute("searchResultDTOs", searchResultDTOs);
        return "manager/check_search";
    }

}
