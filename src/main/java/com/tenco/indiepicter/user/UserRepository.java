package com.tenco.indiepicter.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	
	// 회원 가입
	public void insert(User user);
	
	// 이메일 중복 검사
	public boolean selectId(String userEmail);
	
	// 회원 전체 조회
	public List<User> findAll();
	
	
	
}
