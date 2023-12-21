package com.tenco.indiepicter.admin;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter.admin.response.AdminPagingResponseDTO;
import com.tenco.indiepicter.invitation.response.InvitationResponseDTO;
import com.tenco.indiepicter.user.User;
import com.tenco.indiepicter.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

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
		public String vipIssued(InvitationResponseDTO responseDto, Errors errors){

			if(responseDto.getMovieTime() == null || responseDto.getMovieTime().isEmpty()){
				throw new MyDynamicException("날짜와 시간을 지정해 주세요.", HttpStatus.BAD_REQUEST);
			}
			if(responseDto.getInvitationCode() == null || responseDto.getInvitationCode().isEmpty()){
				throw new MyDynamicException("초청권 코드를 입력하세요.", HttpStatus.BAD_REQUEST);
			}
			if(responseDto.getMovieName() == null || responseDto.getMovieName().isEmpty()){
				throw new MyDynamicException("영화 제목을 입력해 주세요.", HttpStatus.BAD_REQUEST);
			}
			if(responseDto.getTheaterName() == null || responseDto.getTheaterName().isEmpty()){
				throw new MyDynamicException("극장 이름을 입력해 주세요.", HttpStatus.BAD_REQUEST);
			}
			if(responseDto.getTheaterAddress() == null || responseDto.getTheaterAddress().isEmpty()){
				throw new MyDynamicException("극장 주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
			}

			this.adminService.vipIssued(responseDto);

			return "redirect:/admin/invitation";
		}

//---------------------------------------------------------------------------------
		// 일반 회원 관리
		@GetMapping("/user-management")
		public String userManagement(
				@RequestParam(value="page", required=false, defaultValue="1") Integer page,
				Model model) {
			List<User> adminUserPagingLists = this.adminService.adminUserPagingLists(page);
			AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.pagingParam(page);
			model.addAttribute("adminUserPagingLists", adminUserPagingLists);
			model.addAttribute("paging", adminPagingResponseDTO);

			return "manager/user_management";
		}

		// 일반 회원 관리(회원 탈퇴)
		@GetMapping("/user-management-isWithdrawal/{id}")
		public String userManagementIsWithdrawal(@PathVariable Integer id){
			this.adminService.isWithdrawal(id);
			return "redirect:/admin/user-management";
		}
//---------------------------------------------------------------------------------

		// VIP 회원 관리
		@GetMapping("/vip-management")
		public String vipManagement(
				@RequestParam(value="page", required=false, defaultValue="1") Integer page,
				Model model) {

			List<User> adminVipPagingLists = this.adminService.adminVipPagingLists(page);
			AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.pagingParam(page);
			model.addAttribute("adminVipPagingLists", adminVipPagingLists);
			model.addAttribute("paging", adminPagingResponseDTO);
			
			return "manager/vip_management";
		}

		// 일반 회원 관리(회원 탈퇴)
		@GetMapping("/vip-management-isWithdrawal/{id}")
		public String vipManagementIsWithdrawal(@PathVariable Integer id){
			this.adminService.isWithdrawal(id);
			return "redirect:/admin/vip-management";
		}

//---------------------------------------------------------------------------------

		// 회원 등급 수정 페이지
		@GetMapping("/grade-update")
		public String gradeUpdate(
				@RequestParam(value="page", required=false, defaultValue="1") Integer page,
				Model model) {

			List<User> adminInvitationPagingLists = this.adminService.adminAllPagingLists(page);
			AdminPagingResponseDTO adminPagingResponseDTO = this.adminService.pagingParam(page);
			model.addAttribute("adminInvitationPagingLists", adminInvitationPagingLists);
			model.addAttribute("paging", adminPagingResponseDTO);

			return "/manager/grade_update";
		}


//---------------------------------------------------------------------------------
		// 온라인 오픈 기간 설정
		@GetMapping("/playday")
		public String playday() {
			
			return "manager/playday";
		}
//---------------------------------------------------------------------------------
		// 채팅방 오픈
		@GetMapping("/chatting")
		public String chatting() {
			
			return "manager/chatting";
		}
//---------------------------------------------------------------------------------
		// 감상평 관리
		@GetMapping("/review")
		public String review() {
			
			return "manager/review";
		}
	
}

// 12-20 18:12 학원 작업 끝~
