package com.tenco.indiepicter.user;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.indiepicter.user.UserRequest.JoinDTO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	
	
	// 회원 가입 페이지 요청(GET)
	@GetMapping("/joinUp")
	public String joinUp() {
		
		return "user/join";
	}
	
	// 회원 가입 페이지 요청(POST)
	@PostMapping("/joinUp")
	public String joinUpProc(@Valid UserRequest.JoinDTO requestDto, Error error) {
		
		if(requestDto.getPassword1() == requestDto.getPassword2()) {
			
			this.userService.join(requestDto);
		}
		
		return "redirect:/user/list";
	}
	
	// 로그인 페이지 요청(GET)
	@GetMapping("/joinIn")
	public String joinIn() {
		
		
		return "user/login";
	}
	
	// 로그인 페이지 요청(POST)
	@PostMapping("/joinIn")
	public String joinInProc() {
		
		return "redirect:/user/join";
	}
	
	
	// 회원 전체 조회
	@GetMapping("/list")
	public String list(Model model) {
		
		List<User> userLists = this.userService.userLists();
		
		model.addAttribute("userLists", userLists);
		
		return "user/list";
	}
	
	
	
	
	
	
//	@GetMapping("/join")
//	public String join1(@Valid UserRequest.JoinDTO requestdto, Error errors) {
//		
//		return "user/join";
//	}
	
}
