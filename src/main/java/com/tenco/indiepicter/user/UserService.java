package com.tenco.indiepicter.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.indiepicter.user.UserRequest.JoinDTO;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository; 
	
	// 회원 가입
	public void join(UserRequest.JoinDTO requestDto){
		
		User user = new User();
		
		user.setUserEmail(requestDto.getUserEmail());
		user.setPassword(requestDto.getPassword1());
		user.setUsername(requestDto.getUsername());
		user.setTel(requestDto.getTel());
		
		this.userRepository.insert(user);
	
	}
	
	// 회원 전체 조회
	public List<User> userLists(){
	
		return this.userRepository.findAll();
	}
	
	
}
