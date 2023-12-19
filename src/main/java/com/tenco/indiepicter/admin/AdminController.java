package com.tenco.indiepicter.admin;

import com.tenco.indiepicter.admin.response.AdminPagingResponseDTO;
import com.tenco.indiepicter.user.User;
import com.tenco.indiepicter.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {


	@Autowired
	private AdminService adminService;

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

//		// VIP 초청권 발급
//		@GetMapping("/vip-issued/{id}")
//		public String vipIssued(@PathVariable Integer id){
//			this.adminService.vipIssued(id);
//			return "redirect:/admin/invitation";
//		}

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

// 12-19 17:19 학원 작업중 ~
