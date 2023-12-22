package com.tenco.indiepicter.user;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter.invitation.Invitation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.user.request.UserProfileRequestDTO;
import com.tenco.indiepicter.user.request.UserRequestDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

//--------------------------------------------------------------------------------
	
	// 회원 가입
	@Transactional
	public int join(UserRequestDTO.JoinDTO requestDto){
		
		String password = requestDto.getPassword1();
		// 비밀번호 인코딩
		String encodingPassword = passwordEncoder.encode(password);
		
		User user = User.builder()
					.userEmail(requestDto.getUserEmail())
					.password(requestDto.getPassword1())
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
			throw new MyDynamicException("이메일이 잘못되었습니다.", HttpStatus.BAD_REQUEST);
		}
		// 유저 비밀번호가 db에 저장된 값과 비교
		boolean passwordCheck = passwordEncoder.matches(requestDto.getPassword(), user.getPassword());
		
		// 비밀번호 유효성 검사
		if(passwordCheck == false) {
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
		
		// 이 코드를 사용하니깐 ajax가 작동이 안됨... 일단 주석!!
//		// 이메일 중복 유효성 검사
//		if(result != 1) {
//			throw new MyDynamicException("이미 존재하는 이메일입니당.", HttpStatus.BAD_REQUEST);
//		}
		
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
	public int update(UserProfileRequestDTO dto, Integer principalId) {
		
		User sessionUser = (User)session.getAttribute(Define.PRINCIPAL);
		
		if(!dto.getPassword1().equals(dto.getPassword2())) {
			throw new MyDynamicException("비밀번호를 다시 확인해주세요.", HttpStatus.BAD_REQUEST);
		}
		
		String password = dto.getPassword1();
		
		String encodingPassword = passwordEncoder.encode(password);
		dto.setPassword1(encodingPassword);
		
		int resultRowCount = userRepository.update(dto);
		
		if(resultRowCount != 1) {	
			throw new MyDynamicException("수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		sessionUser = userRepository.findById(principalId);
		session.setAttribute("sessionUser", sessionUser);
		
		return resultRowCount;
	}

//--------------------------------------------------------------------------------
	// 카카오 로그인 (유저이름 찾기)
	public User UserEmail(String userEmail) {
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

}
