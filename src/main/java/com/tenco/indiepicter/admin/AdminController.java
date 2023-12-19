package com.tenco.indiepicter.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
		// 관리자 메인 페이지
		@GetMapping("/main")
		public String main() {
			
			return "manager/main";
		}

		
		// 펀딩 현황 확인 페이지
		@GetMapping("/check")
		public String check() {
			
			return "manager/check";
		}
		

		
		// VIP 초청권 페이지
		@GetMapping("/invitation")
		public String invitation() {
			
			return "manager/invitation";
		}
		
		// VIP 회원 관리
		@GetMapping("/user_management")
		public String userManagement() {
			
			return "manager/user_management";
		}
		
		// 일반 회원 관리
		@GetMapping("/vip_management")
		public String vipManagement() {
			
			return "manager/vip_management";
		}
		
		// 온라인 오픈 기간 설정
		@GetMapping("/playday")
		public String playday() {
			
			return "manager/playday";
		}
		
		// 채팅방 오픈
		@GetMapping("/chatting")
		public String chatting() {
			
			return "manager/chatting";
		}
		
		// 감상평 관리
		@GetMapping("/review")
		public String review() {
			
			return "manager/review";
		}
	
}
