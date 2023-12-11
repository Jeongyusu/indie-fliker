package com.tenco.indiepicter.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

//--------------------------------------------------------------------------------
	
	// 회원 가입
	@Transactional
	public int join(UserRequest.JoinDTO requestDto){
		
		String password = requestDto.getPassword1();
		// 비밀번호 인코딩
		String encodingPassword = passwordEncoder.encode(password); 
		
		User user = User.builder()
					.userEmail(requestDto.getUserEmail())
					.password(encodingPassword)
					.username(requestDto.getUsername())
					.tel(requestDto.getTel())
					.gubun("NORMAL")
					.grade("NORMAL")
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
	public User login(UserRequest.loginDTO requestDto) {
		
		// 유저 이메일 조회
		User user = this.userRepository.findByUserEmail(requestDto.getUserEmail());
		
		// 이메일 유효성 검사 
		if(user == null) {
			throw new MyDynamicException("아이디가 잘못되었습니다.", HttpStatus.BAD_REQUEST);
		}
		
		// 유저 비밀번호가 db에 저장된 값과 비교
		boolean passwordCheck = passwordEncoder.matches(requestDto.getPassword(), user.getPassword());
		
		// 비밀번호 유효성 검사
		if(passwordCheck == false) {
			throw new MyDynamicException("비밀번호가 잘못되었습니다.", HttpStatus.BAD_REQUEST);
		}
		
		return user;
	}
	
//--------------------------------------------------------------------------------
	
	// 이메일 중복 검사
	public int findByEmailCheck(String userEmail) {
		
		int result = this.userRepository.findByEmailCheck(userEmail);
		
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
	
	// 이메일 중복 검사
	public boolean selectId(String userEmail) {
		return this.userRepository.selectId(userEmail);
	}
	
//	log.debug("________________________________________________________");
//	log.debug(requestDto.getPassword1() + " == " + user.getPassword());
//	log.debug("________________________________________________________");
}
