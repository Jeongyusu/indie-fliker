package com.tenco.indiepicter.user;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.tenco.indiepicter.user.request.UserProfileRequestDTO;
import com.tenco.indiepicter.user.request.UserRequestDTO;

@Mapper
public interface UserRepository {
	
	// 회원 가입
	public int insert(User user);
	
	// 사용자 이름과 비밀번호로 조회(로그인)
	public User findByUseruserEmailAndPassword(UserRequestDTO.JoinDTO requestDto);
	
	// 회원 이메일로 단일 조회
	public User findByUserEmail(String userEmail);
	
	// 이메일 중복 체크
	public int findByEmailCheck(String userEmail);
	
	// 회원 전체 조회
	public List<User> findAll();
	
	// 회원 아이디로 단일 조회
	public User findById(Integer id);
	
	// 회원 프로필 수정
	public int update(UserProfileRequestDTO dto);

	// 회원 탈퇴
	public void userIsWithdrawal(Integer principal);

}
