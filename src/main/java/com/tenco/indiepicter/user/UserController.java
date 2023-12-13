package com.tenco.indiepicter.user;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter._core.vo.MyPath;
import com.tenco.indiepicter.reservation.ReservationService;
import com.tenco.indiepicter.user.request.UserProfileRequestDTO;
import com.tenco.indiepicter.user.request.UserRequestDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;
	
	private ReservationService reservationService;
	


//------------------------------------------------------------------------------------------------------------------
	
	// 회원 가입 페이지 요청(GET)
	@GetMapping("/join")
	public String joinUp() {
		
		return "user/join";
	}
	
	// 회원 가입 페이지 요청(POST)
	@PostMapping("/join")
	public String joinUpProc(@Valid UserRequestDTO.JoinDTO requestDto, Errors errors) {
		
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
	public String joinInProc(@Valid UserRequestDTO.loginDTO requestDto, Errors errors) {

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
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout() {
		
		session.invalidate();
		
		return "redirect:/user/login";
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
		
//		int reservationTicket = this.reservationService.findById();
//		
//		model.addAttribute("reservationTicket", reservationTicket);
		
		return "mypage/mypage";
	}
	
//----------------------------------------------------------------------------------------------------------------
	
	// 회원 프로필 수정(GET)
	@GetMapping("/profile")
	public String profile(Model model) {
		
		User user = (User)session.getAttribute(Define.PRINCIPAL);
		
		model.addAttribute("user", user);
		
		return "user/profile";
	}
	
	// 회원 프로필 수정(POST)
	@PostMapping("/profile")
	public String profileUpdate(UserProfileRequestDTO dto) {
			
		MultipartFile file = dto.getFile();
		
		if(file.isEmpty() == false) {
			
			// 파일 사이즈 체크
			if(file.getSize() > Define.MAX_FILE_SIZE) {
				throw new MyDynamicException("파일 크기는 20MB 이상 클 수 없습니다.", HttpStatus.BAD_REQUEST);
			}
			
		}
		
		try {
			// 업로드 파일 경로
			String saveDirectory = Define.UPLOAD_DIRECTORY;
			// 폴더가 없다면 오류 발생
			File dir = new File(saveDirectory);
			
			// exists - 파일이 존재하는지 여부를 알 수 있습니다. (존재하면 true, 아니면 false)
			// mkdir - 폴더가 없다면 생성합니다.
			// 따라서 dir에 폴더가 없다면 폴더를 만들어라~		
			if(dir.exists() == false) {
				dir.mkdir();
			}
			
			// 파일 이름 (중복 이름 처리 예방)			
			UUID uuid = UUID.randomUUID(); // UUID - 개체를 고유하게 식별 가능한 값을 랜덤으로 생성해준다.
			
			// 새로운 파일 이름 생성(파일 이름의 중복을 방지하므로 파일 덮어쓰기가 안된다.)
			String fileName = uuid + "_" + file.getOriginalFilename();
			
			// 전체 경로 지정 생성
			// separator - 각각의 OS는 파일 구분자가 다르게 인식하기 때문에 (윈도우:\ , 리눅스:/)
			// 실행되는 OS에 따라 맞추어서 제공한다
			String uploadPath = Define.UPLOAD_DIRECTORY + File.separator + fileName;
			
			// 목적지
			File destination = new File(uploadPath);
			
			// 반드시 사용!!
			// transferTo - 파일을 저장한다.(실제 생성)
			file.transferTo(destination);
			
			
			// 객체 상태 변경 (insert 처리 하기 위함 -> 쿼리 수정해야 함)
			dto.setOriginFileName(file.getOriginalFilename()); // 사용자가 입력한 파일명
			dto.setUploadFileName(fileName); // 로컬 저장소로 최종 업로드 되는 주소!!
			
		} catch(Exception e) {
			log.debug(e.getMessage());
		}
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		this.userService.update(dto, principal.getId());
		
		return "redirect:/user/mypage";
	}
	
}













