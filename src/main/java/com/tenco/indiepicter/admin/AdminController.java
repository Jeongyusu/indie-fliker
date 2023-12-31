package com.tenco.indiepicter.admin;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter.admin.response.AdminPagingResponseDTO;
import com.tenco.indiepicter.funding.response.AdminOfflineStreamingSearchDTO;
import com.tenco.indiepicter.invitation.request.InvitationRequestDTO;
import com.tenco.indiepicter.invitation.response.InvitationResponseDTO;
import com.tenco.indiepicter.user.User;
import com.tenco.indiepicter.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {


	@Autowired
	private AdminService adminService;

	@Autowired
	private UserService userService;

//---------------------------------------------------------------------------------

	// 관리자 메인 페이지
	@GetMapping("/main")
	public String main() {

		return "manager/main";
	}

//---------------------------------------------------------------------------------

	// 영화 등록 허가 페이지
	@GetMapping("/register")
	public String register() {

		return "manager/register";
	}

//---------------------------------------------------------------------------------
	// 펀딩 현황 확인 페이지
	@GetMapping("/check")
	public String check() {
			
		return "manager/check";
	}
//---------------------------------------------------------------------------------

	// 펀딩 등록 삭제
	@GetMapping("/update-delete")
	public String updateDelete() {

		return "manager/update_delete";
	}
//---------------------------------------------------------------------------------

	// VIP 초청권 페이지
	@GetMapping("/invitation")
	public String invitation(
			@RequestParam(value="page", required=false, defaultValue="1") Integer page,
			Model model) {

			List<User> adminInvitationPagingLists = this.adminService.adminAllPagingLists(page);
			AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.pagingParam(page);
			model.addAttribute("adminInvitationPagingLists", adminInvitationPagingLists);
			model.addAttribute("paging", adminPagingResponseDTO);

		return "manager/invitation";
	}

	// VIP 초청권 발급
	@PostMapping("/vip-issued")
	@ResponseBody
	public ResponseEntity<?> vipIssued(@RequestBody InvitationRequestDTO invitationRequestDto, Errors errors){

		if(invitationRequestDto.getMovieTime() == null || invitationRequestDto.getMovieTime().isEmpty()){
			throw new MyDynamicException("날짜와 시간을 지정해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if(invitationRequestDto.getInvitationCode() == null || invitationRequestDto.getInvitationCode().isEmpty()){
			throw new MyDynamicException("초청권 코드를 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		if(invitationRequestDto.getMovieName() == null || invitationRequestDto.getMovieName().isEmpty()){
			throw new MyDynamicException("영화 제목을 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if(invitationRequestDto.getTheaterName() == null || invitationRequestDto.getTheaterName().isEmpty()){
			throw new MyDynamicException("극장 이름을 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if(invitationRequestDto.getTheaterAddress() == null || invitationRequestDto.getTheaterAddress().isEmpty()){
			throw new MyDynamicException("극장 주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}

		this.adminService.vipIssued(invitationRequestDto);

		return ResponseEntity.ok().body(ApiUtils.success(null));
	}

//---------------------------------------------------------------------------------
	// 일반 회원 관리
	@GetMapping("/user-management")
	public String userManagement(
			@RequestParam(value="page", required=false, defaultValue="1") Integer page,
			Model model) {
		List<User> adminUserPagingLists = this.adminService.adminUserPagingLists(page);
		AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.normalPagingParam(page);
		model.addAttribute("adminUserPagingLists", adminUserPagingLists);
		model.addAttribute("paging", adminPagingResponseDTO);

		return "manager/user_management";
	}

	// 일반 회원 관리(회원 탈퇴)
	@GetMapping("/user-management-isWithdrawal")
	@ResponseBody
	public ResponseEntity<?> userManagementIsWithdrawal(@RequestParam Integer userId){
		int resultCount = this.adminService.isWithdrawal(userId);
		return ResponseEntity.ok().body(ApiUtils.success(null));
	}

//---------------------------------------------------------------------------------

	// VIP 회원 관리
	@GetMapping("/vip-management")
	public String vipManagement(
			@RequestParam(value="page", required=false, defaultValue="1") Integer page,
			Model model) {

		List<User> adminVipPagingLists = this.adminService.adminVipPagingLists(page);
		AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.vipPagingParam(page);
		model.addAttribute("adminVipPagingLists", adminVipPagingLists);
		model.addAttribute("paging", adminPagingResponseDTO);
			
		return "manager/vip_management";
	}

	// VIP 회원 관리(회원 탈퇴)
	@GetMapping("/vip-management-isWithdrawal")
	@ResponseBody
	public ResponseEntity<?> vipManagementIsWithdrawal(@RequestParam Integer userId){
		this.adminService.isWithdrawal(userId);
		return ResponseEntity.ok().body(ApiUtils.success(null));
	}

//---------------------------------------------------------------------------------

	// 회원 등급 수정 페이지
	@GetMapping("/grade-update")
	public String gradeUpdate(
			@RequestParam(value="page", required=false, defaultValue="1") Integer page,
			Model model) {

		List<User> adminGradeUpdatePagingLists = this.adminService.adminAllPagingLists(page);
		AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.pagingParam(page);
		model.addAttribute("adminGradeUpdatePagingLists", adminGradeUpdatePagingLists);
		model.addAttribute("paging", adminPagingResponseDTO);

		return "/manager/grade_update";
	}

	//회원 등급 수정 (VIP)
	@GetMapping("/grade-update-vip/{id}")
	public String gradeUpdateVip(@PathVariable Integer id){
		this.adminService.updateVip(id);
		return "redirect:/admin/grade-update";
	}

	//회원 등급 수정 (NORMAL)
	@GetMapping("/grade-update-normal/{id}")
	public String gradeUpdateNormal(@PathVariable Integer id) {
		this.adminService.updateNormal(id);
		return "redirect:/admin/grade-update";
	}


//---------------------------------------------------------------------------------
	// 온라인 오픈 기간 설정
	@GetMapping("/playday")
	public String playday () {

		return "manager/playday";
	}
//---------------------------------------------------------------------------------
	// 채팅방 오픈
	@GetMapping("/chatting")
	public String chatting () {

		return "manager/chatting";
	}
//---------------------------------------------------------------------------------
	// 감상평 관리
	@GetMapping("/review")
	public String review () {

		return "manager/review";
	}

	// 초청권 관리 검색어 조회
	@GetMapping("/invitation/search")
	public String userInvitationSearch(@RequestParam( name ="keyword") String keyword, @RequestParam(value="page", required=false, defaultValue="1") Integer page, Model model){
		List<User> adminInvitationPagingLists = adminService.adminUserPagingKeywordLists(page,keyword);
		AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.keywordPagingParam(page, keyword);
		model.addAttribute("adminInvitationPagingLists", adminInvitationPagingLists);
		model.addAttribute("paging", adminPagingResponseDTO);
		log.debug("페이징값테스트");
		log.debug(adminPagingResponseDTO.toString());
		return "manager/invitation_search";
	}
	 //회원 등급 검색어 조회
	@GetMapping("/grade/search")
	public String userGradeSearch(@RequestParam( name ="keyword") String keyword, @RequestParam(value="page", required=false, defaultValue="1") Integer page, Model model){
		List<User> adminGradeUpdatePagingLists = adminService.adminUserPagingKeywordLists(page,keyword);
		AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.keywordPagingParam(page, keyword);
		model.addAttribute("adminGradeUpdatePagingLists", adminGradeUpdatePagingLists);
		model.addAttribute("paging", adminPagingResponseDTO);
		return "manager/grade_update_search";
	}
//
	// 일반 회원 관리 검색어 조회
	@GetMapping("/normal/search")
	public String userNormalSearch(@RequestParam( name ="keyword") String keyword, @RequestParam(value="page", required=false, defaultValue="1") Integer page, Model model){
		List<User> adminUserPagingLists = adminService.findByAdminNormalPagingKeywordLists(page,keyword);
		AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.keywordNormalPagingParams(page, keyword);
		model.addAttribute("adminUserPagingLists", adminUserPagingLists);
		model.addAttribute("paging", adminPagingResponseDTO);
		return "manager/user_management_search";
	}
//
	// vip회원 관리 검색어 조회
	@GetMapping("/vip/search")
	public String userVIPSearch(@RequestParam( name ="keyword") String keyword, @RequestParam(value="page", required=false, defaultValue="1") Integer page, Model model){
		List<User> adminVipPagingLists = adminService.findByAdminVipPagingKeywordLists(page,keyword);
		log.debug("출력결과 : " + adminVipPagingLists.toString());
		AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.keywordVIPPagingParams(page, keyword);
		model.addAttribute("adminVipPagingLists", adminVipPagingLists);
		model.addAttribute("paging", adminPagingResponseDTO);
		return "manager/vip_management_search";
	}
}

// 12-30 23:53 작업 중~~