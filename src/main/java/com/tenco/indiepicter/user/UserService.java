package com.tenco.indiepicter.user;

import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import com.tenco.indiepicter.user.request.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;

@Service
@Slf4j
public class UserService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private JavaMailSender javaMailSender;

//--------------------------------------------------------------------------------
	
	// 회원 가입
	@Transactional
	public int join(UserRequestDTO.JoinDTO requestDto){
		
		String password = requestDto.getPassword1();
		// 비밀번호 인코딩
		String encodingPassword = passwordEncoder.encode(password);
		
		User user = User.builder()
					.userEmail(requestDto.getUserEmail())
					.password(encodingPassword)
					.username(requestDto.getUsername())
					.pic(Define.userbasicpic)
					.grade("NORMAL")
					.tel(requestDto.getTel())
					.gubun("NORMAL")
				    .isWithdrawal(false)
					.build();
								
		int resultUserCount = this.userRepository.insert(user);
		
		if(resultUserCount != 1) {
			throw new MyDynamicException("회원가입에 실패했습니다.", HttpStatus.BAD_REQUEST);
		}
		
		return resultUserCount;
	}

//--------------------------------------------------------------------------------
	
	// 로그인
	@Transactional
	public User login(UserRequestDTO.loginDTO requestDto) {
		
		// 유저 이메일 조회
		User user = this.userRepository.findByUserEmail(requestDto.getUserEmail());
		
		// 이메일 유효성 검사 
		if(user == null) {
			throw new MyDynamicException("이메일을 잘못 입력했습니다.", HttpStatus.BAD_REQUEST);
		}

		// 유저 비밀번호가 db에 저장된 값과 비교
		boolean passwordCheck = passwordEncoder.matches(requestDto.getPassword(), user.getPassword());

		// 비밀번호 유효성 검사
		if(!user.getPassword().equals(requestDto.getPassword()) && passwordCheck == false) {
			throw new MyDynamicException("비밀번호가 잘못되었습니다.", HttpStatus.BAD_REQUEST);
		}
		// 탈퇴 유저 유효성 검사
		if(user.isWithdrawal()){
			throw new MyDynamicException("탈퇴한 계정입니다.", HttpStatus.BAD_REQUEST);
		}

		return user;
	}
	
//--------------------------------------------------------------------------------
	
	// 이메일 중복 검사
	public int findByEmailCheck(String userEmail) {
		int result = this.userRepository.findByEmailCheck(userEmail);
		return result;
	}
	
//--------------------------------------------------------------------------------
	
	// 회원 전체 조회
	public List<User> userLists(){
		List<User> userLists = this.userRepository.findAll();
		return userLists;
	}

//--------------------------------------------------------------------------------	

	// 회원 프로필 조회
	public User findById(Integer id) {
		User user = this.userRepository.findById(id);
		return user;
	}
	
	// 회원 프로필 수정
	@Transactional
	public void profileUpdate(UserProfileRequestDTO dto) {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);

		String username = this.userRepository.findBySameUsername(dto.getUsername());
//		if (dto.getUsername().equals(username)){
//			throw new MyDynamicException("이미 존재하는 닉네임입니다.", HttpStatus.BAD_REQUEST);
//		}
		if(!dto.getPassword1().equals(dto.getPassword2())) {
			throw new MyDynamicException("비밀번호를 다시 확인해주세요.", HttpStatus.BAD_REQUEST);
		}
		
		if (dto.getPassword1() == null || dto.getPassword1().isEmpty()){
			this.userRepository.profileUpdateNotPassword(dto);
		}else {
			String password = dto.getPassword1();
			String encodingPassword = passwordEncoder.encode(password);
			dto.setPassword1(encodingPassword);
			this.userRepository.profileUpdate(dto);
		}

//		if(resultRowCount != 1) {
//			throw new MyDynamicException("수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//
//		sessionUser = userRepository.findById(principalId);
//		session.setAttribute("sessionUser", sessionUser);
//
//		return resultRowCount;
	}

	// DB에 등록된 전화번호가 존재하는지 조회
	public String userTel(UserProfileRequestDTO dto){
		return this.userRepository.findByTel(dto.getTel());
	}

//--------------------------------------------------------------------------------
	// 카카오 로그인 (유저이름 찾기)
	public User kakaoUserEmail(String userEmail) {
		return this.userRepository.findByUserEmail(userEmail);
	}
//--------------------------------------------------------------------------------
	// 회원 탈퇴
	public void userIsWithdrawal(Integer principal){
		this.userRepository.userIsWithdrawal(principal);
	}
//--------------------------------------------------------------------------------
	// 회원 단일 조회
	public User userinfo(Integer principal){ return this.userRepository.findById(principal); }
//--------------------------------------------------------------------------------
	// 회원의 초청권 갯수 조회
	public Integer userInvitation(Integer principal){ return this.userRepository.findByInvitation(principal); }
//--------------------------------------------------------------------------------
	// 카카오 간편 로그인 회원만 조회
	public User kakaoLoginUser(){ return this.userRepository.findByKakao(); }
//--------------------------------------------------------------------------------
	// 이름, 전화번호로 이메일 조회
	public String nameAndTelToEmail(FindUserInfoDTO findUserInfoDTO){
		return this.userRepository.findByNameAndTelToEmail(findUserInfoDTO.getUsername(), findUserInfoDTO.getTel());
	}
//--------------------------------------------------------------------------------

//--------------------------------------------------------------------------------
	// 회원 이름, 전화번호를 이용해서 이메일 찾기
	public String userEmail(@RequestParam String username, @RequestParam String tel){

		String userEmail = this.userRepository.findByEmail(username, tel);

		if (userEmail == null){
			throw new MyDynamicException("이메일이 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
		}

		return userEmail;
	}

	//랜덤함수로 임시비밀번호 만들기
	public String tempPassword(){
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
				'W', 'X', 'Y', 'Z' };
		String password = "";
		// 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
		int j = 0;
		for (int i = 0; i < 10; i++) {
			j = (int) (charSet.length * Math.random());
			password += charSet[j];
		}
		return password;
	}

	// 이메일 보내기 (이메일 작성 후 ~ 임시 비밀번호로 회원 비밀번호 업데이트)
	public MailDTO sendEail(SendEmailDTO sendEmailDto){
		String pw = tempPassword(); // 임시 비밀번호 생성
		MailDTO maildto = new MailDTO();
		maildto.setAddress(sendEmailDto.getUserEmail());
		maildto.setTitle("[ indiefliker ] 임시비밀번호 안내 이메일 입니다.");
		maildto.setMessage("안녕하세요. indiefliker 임시비밀번호 안내 관련 이메일 입니다." +
				           " 회원님의 임시 비밀번호는 " + pw + " 입니다." +
				           " 로그인 후에 비밀번호를 변경을 해주세요!");

		this.userRepository.tempPasswordUpdate(pw, sendEmailDto.getUserEmail());

		return maildto;
	}

	// 실제 이메일 보내기
	public void mailSend(MailDTO mailDto) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mailDto.getAddress());
		message.setSubject(mailDto.getTitle());
		message.setText(mailDto.getMessage());
		message.setFrom("indiefliker@gmail.com");
		message.setReplyTo("indiefliker@gmail.com");
		javaMailSender.send(message);
	}

	// 입력한 이메일로 DB에 저장된 이메일 찾기
	public String emailSearch(String userEmail){
		String email = this.userRepository.findByMail(userEmail);
		return email;
	}

//--------------------------------------------------------------------------------

    // 회원 비밀번호 수정
	@Transactional
	public void passwordUpdate(UserPasswordUpdateDTO dto){

		User user = this.userRepository.findByUserEmail(dto.getUserEmail());

		if (user == null){
			throw new MyDynamicException("존재하지 않은 이메일입니다.",	HttpStatus.BAD_REQUEST);
		}

		String userEmail = dto.getUserEmail();
		String password1 = dto.getPassword1();
		String encodingPassword = passwordEncoder.encode(password1); // 비밀번호 인코딩

		this.userRepository.passwordUpdate(userEmail, encodingPassword);

	}
//--------------------------------------------------------------------------------




}
