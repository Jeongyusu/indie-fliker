package com.tenco.indiepicter.user;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.http.client.methods.HttpHead;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter._core.vo.MyPath;
import com.tenco.indiepicter.reservation.ReservationService;
import com.tenco.indiepicter.user.request.UserProfileRequestDTO;
import com.tenco.indiepicter.user.request.UserRequestDTO;
import com.tenco.indiepicter.user.response.KakaoProfile;
import com.tenco.indiepicter.user.response.OAuthToken;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private HttpSession session;
	
	// yml 파일에 있는 초기 파라미터 설정한 변수를 자기고 옴
	@Value("${tenco.key}")
	private String tencokey;

	@Autowired
	private UserService userService;
	
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
		return "redirect:/fund/funding-plus";
	}
	
//---------------------------------------------------------------------------------------------------------------
	
	// 카카오 로그인
	@GetMapping("/kakao-callback")
	public String kakaoCallBack(@RequestParam String code) {
		
		// RestTemplate - 스프링에서 지원하는 restapi 호출할 수 있는 내장 클래스
		RestTemplate rt1 = new RestTemplate();
		
		// 헤더 구성
		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// 바디 구성 - MultivalueMap 은 일반 Map과 다르게 키의 중복이 가능하다.
		MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
		params1.add("grant_type", "authorization_code"); // 고정값임
		params1.add("client_id", "eaa873dc471f9ad17affff6005825aef"); // rest api 키 값
		params1.add("redirect_uri", "http://localhost:80/user/kakao-callback"); // redirect 주소를 설정했을 때 값
		params1.add("code", code); // 컨트롤러 요청에서 매개변수
		
		// 헤더와 바디 결합
		HttpEntity<MultiValueMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);
		
		// 요청 처리
		// 카카오에서 토큰을 받기 위해서 POST로 요청을 한다( https://kauth.kakao.com/oauth/token )
		ResponseEntity<OAuthToken> response1 = rt1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, requestMsg1, OAuthToken.class);
		
//		// 결과 확인
//		log.debug("--------------------");
//		log.debug(response1.getHeaders());
//		log.debug(response1.getBody());
//		log.debug(response1.getBody().getAccessToken());
//		log.debug(response1.getBody().getRefreshToken());
//		log.debug("--------------------");
//		// 여기까지 토큰 받기 위함
		
		// restapi 호출
		RestTemplate rt2 = new RestTemplate();
		
		// 헤더 구성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response1.getBody().getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// 바디 구성 생략(필수 아님)
		
		// 헤더와 바디 결합
		HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);
		
		// 요청
		ResponseEntity<KakaoProfile> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, requestMsg2, KakaoProfile.class);
		
		log.debug("__________ 카카오 서버 정보 받기 완료 ______________");
		log.debug("_______________________________________________");
		log.debug(response2.getBody().getProperties().getNickname());
		log.debug(response2.getBody().getProperties().getProfileImage());
		log.debug(response2.getBody().getProperties().getThumbnailImage());
		log.debug("_______________________________________________");
		log.debug("__________ 카카오 서버 정보 받기 완료 ______________");
		// 여기 까지 카카오 서버에 존재하는 정보를 요청 처리 과정
		
		// 1. 회원 가입 여부 확인
		// 최초 사용자라면 우리 사이트에 회원 가입을 자동 완료
		// 추가 정보 입력 화면 (추가 정보가 있다면 기능을 만들기) -> DB 저장 처리
		KakaoProfile kakaoProfile = response2.getBody();
		
		// 소셜 회원 가입자는 전부 비밀번호가 동일하게 된다. (tencokey)
		UserRequestDTO.JoinDTO dto = UserRequestDTO.JoinDTO.builder()
							 .userEmail("OAuth_" + kakaoProfile.getId() + "님")
							 .password1(tencokey)
							 .username("카카오")
							 .tel("카카오")
							 .build();
		
		// 콘솔창에서 tencokey 확인 해보기
		log.debug("------------------------------");
		log.debug("tencokey = " + tencokey);
		log.debug("------------------------------");
		
		User oldUser = this.userService.findByUserEmail(dto.getUserEmail());
		
		if(oldUser == null) {
			this.userService.join(dto); // 회원가입 자동 처리
			log.debug("---------------------------");
			log.debug(oldUser.toString());
			log.debug("---------------------------");
			oldUser = this.userService.findByUserEmail(dto.getUserEmail()); // olduser의 email정보 유지
		}
		
		// 로그인 처리
		// 만약 소셜 로그인 사용자가 회원가입 처리 완료된 사용자라면
		// 바로 세션 처리 및 로그인 처리
		// oldUser의 비밀번호는 tencokey로 처리해서 모두 똑같기 때문에
		// 비밀번호가 누출되었을때를 방지하기 위해서 null로 처리해버린다.
		oldUser.setUserPassword(null);
		session.setAttribute(Define.PRINCIPAL, oldUser);
		
		return "redirect:/main";
		
	}
	
//---------------------------------------------------------------------------------------------------------------
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout() {
		
		session.invalidate();
		
		return "redirect:/fund/main";
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
	public String myPage(Model model, Integer id) {

		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		if(principal == null) {
			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
		}
			
		return "mypage/mypage";
	}
	
//----------------------------------------------------------------------------------------------------------------
	
	// 회원 프로필 수정(GET)
	@GetMapping("/profile")
	public String profile(Model model) {
		
		User user = (User)session.getAttribute(Define.PRINCIPAL);
		
		if(user == null) {
			throw new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
		}
		
		model.addAttribute("user", user);
		
		return "mypage/profile";
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

		return "mypage/mypage";
	}
	
//----------------------------------------------------------------------------------------------------------------	

	// 회원 탈퇴
	
}



