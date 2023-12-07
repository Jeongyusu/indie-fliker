package com.tenco.indiepicter.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.indiepicter.user.UserRequest.JoinDTO;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository; 
	
	// 회원 가입
	@Transactional
	public void join(UserRequest.JoinDTO requestDto){
		
		User user = User.builder()
					.userEmail(requestDto.getUserEmail())
					.password(requestDto.getPassword1())
					.username(requestDto.getUsername())
					.tel(requestDto.getTel())
					.gubun("NORMAL")
					.grade("NORMAL")
					.build();
					
		this.userRepository.insert(user);
		
	}
	
	// 로그인
	
	
	// 회원 전체 조회
	public List<User> userLists(){
	
		return this.userRepository.findAll();
	}
	
	
}
