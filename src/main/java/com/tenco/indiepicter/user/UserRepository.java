package com.tenco.indiepicter.user;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	
	// 회원 가입
	public void insert(User user);
	
	// 사용자 이름과 비밀번호로 조회(로그인)
	public User findByUseruserEmailAndPassword(UserRequest.JoinDTO requestDto);
	
	// 이메일 중복 조회
	public User findByUserEmail(String userEmail);
	
	// 회원 전체 조회
	public List<User> findAll();
	
	// 이메일 중복 검사
	public boolean selectId(String userEmail);
	
	
}
