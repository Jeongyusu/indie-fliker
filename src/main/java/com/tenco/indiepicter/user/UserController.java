package com.tenco.indiepicter.user;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.reservation.ReservationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ReservationService reservationService;
	
	
//------------------------------------------------------------------------------------------------------------------
	
	// 회원 가입 페이지 요청(GET)
	@GetMapping("/join")
	public String joinUp() {
		
		return "user/join";
	}
	
	// 회원 가입 페이지 요청(POST)
	@PostMapping("/join")
	public String joinUpProc(@Valid UserRequest.JoinDTO requestDto, Errors errors) {
		
		// 이메일 유효성 검사
		if(requestDto.getUserEmail() == null || requestDto.getUserEmail().isEmpty()) {
			throw new MyDynamicException("이메일을 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		// 비밀번호1 유효성 검사
		if(requestDto.getPassword1() == null || requestDto.getPassword1().isEmpty()) {
			throw new MyDynamicException("비밀번호를 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		// 비밀번호2 유효성 검사
		if(requestDto.getPassword2() == null || requestDto.getPassword2().isEmpty()) {
			throw new MyDynamicException("비밀번호를 확인하세요.", HttpStatus.BAD_REQUEST);
		}
		// 비밀번호 중복 유효성 검사
		if(!requestDto.getPassword1().equals(requestDto.getPassword2())) {
			throw new MyDynamicException("비밀번호가 일치하지 않습니다.", HttpStatus.BAD_REQUEST);
		}
		// 이름 유효성 검사
		if(requestDto.getUsername() == null || requestDto.getUsername().isEmpty()) {
			throw new MyDynamicException("이름을 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		// 전화번호 유효성 검사
		if(requestDto.getTel() == null || requestDto.getTel().isEmpty()) {
			throw new MyDynamicException("전화번호를 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		
		this.userService.join(requestDto);
		
		
		
		return "redirect:/user/login";
	}
	
//--------------------------------------------------------------------------------------------------------------

	// 로그인 페이지 요청(GET)
	@GetMapping("/login")
	public String joinIn() {
	
		return "user/login";
	}
	
	// 로그인 페이지 요청(POST)
	@PostMapping("/login")
	public String joinInProc(@Valid UserRequest.loginDTO requestDto, Errors errors) {

		// 이메일 유효성 검사
		if(requestDto.getUserEmail() == null || requestDto.getUserEmail().isEmpty()) {
			throw new MyDynamicException("이메일을 입력하세요.", HttpStatus.BAD_REQUEST);
		}

		// 비밀번호 유효성 검사
		if(requestDto.getPassword() == null || requestDto.getPassword().isEmpty()) {
			throw new MyDynamicException("비밀번호를 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		
		// 서비스 호출
		User principal = userService.login(requestDto);
		
		// 세션 메모리에 유저정보 저장
		session.setAttribute(Define.PRINCIPAL, principal);
		
		return "redirect:/main";
	}	
	
//---------------------------------------------------------------------------------------------------------------	
	
	// 회원 전체 조회
	@GetMapping("/list")
	public String list(Model model) {
		
		List<User> userLists = this.userService.userLists();
		
		model.addAttribute("userLists", userLists);
		
		return "user/list";
	}
	
//----------------------------------------------------------------------------------------------------------------
	
	// 마이페이지 접근
	@GetMapping("/mypage")
	public String myPage(Model model) {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		if(principal == null) {
			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
		}
		
		int reservationTicket = this.reservationService.findById();
		
		model.addAttribute("reservationTicket", reservationTicket);
		
		return "mypage/mypage";
	}
	
//----------------------------------------------------------------------------------------------------------------
	
	
	
}
