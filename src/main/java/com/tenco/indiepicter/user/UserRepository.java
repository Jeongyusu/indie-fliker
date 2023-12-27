package com.tenco.indiepicter.user;

import java.util.List;

import javax.validation.Valid;

import com.tenco.indiepicter.invitation.Invitation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
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
	public User findByUserEmail(@RequestParam String userEmail);
	
	// 이메일 중복 체크
	public int findByEmailCheck(String userEmail);
	
	// 회원 전체 조회
	public List<User> findAll();
	
	// 회원 아이디로 단일 조회
	public User findById(Integer principal);
	
	// 회원 프로필 수정
	public void profileUpdate(UserProfileRequestDTO dto);

	// 회원 프로필 수정(비밀번호는 수정 안한 경우)
	public void profileUpdateNotPassword(UserProfileRequestDTO dto);

	// 회원 탈퇴
	public void userIsWithdrawal(Integer principal);

	// 회원의 초청권 갯수 조회
	public Integer findByInvitation(Integer principal);

	// 카카오 간편 로그인 회원만 조회
	public User findByKakao();

	// 회원 이름과 전화번호로 이메일 조회
	public String findByEmail(@RequestParam String username, @RequestParam String tel);

	// 회원 비밀번호를 임시 비밀번호로 변경
	public void tempPasswordUpdate(@RequestParam String password, @RequestParam String userEmail);

	// 회원 비밀번호 수정
	public void passwordUpdate(@RequestParam String userEmail, @RequestParam String encodingPassword);

	// 입력한 이메일로 DB에 저장된 이메일 찾기
	public String findByMail(@RequestParam String userEmail);
}
