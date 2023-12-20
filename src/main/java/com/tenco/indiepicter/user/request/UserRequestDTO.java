package com.tenco.indiepicter.user.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;

import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;


public class UserRequestDTO {
	
	@Data
	@Builder
	public static class JoinDTO{
		
//		@NotBlank @Email //@Size(min=10, max=20)
//		@NotBlank(message = "이메일을 입력하세요.")
//	    @Length(max = 10, message = "상품명의 최대 길이는 10글자 입니다!")
		private String userEmail;
		
//		@NotBlank //@Size(min=10, max=20)
//		@NotBlank(message = "비밀번호를 입력하세요.")
		private String password1;
		
//		@NotBlank //@Size(min=10, max=20)
//		@NotBlank(message = "비밀번호를 확인하세요.")
		private String password2;
		
//		@NotBlank //@Size(min=10, max=20)
//		@NotBlank(message = "이름을 입력하세요.")
		private String username;
		
//		@NotBlank //@Size(min = 11, max = 11)
//		@NotBlank(message = "전화번호를 입력하세요.")
		private String tel;

		private Timestamp createdAt;
		
	}
	
	@Data
	public static class loginDTO{
		private String userEmail;
		private String password;
		
	}


}
