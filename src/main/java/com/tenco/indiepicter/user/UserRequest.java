package com.tenco.indiepicter.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;


public class UserRequest {
	
	@Data
	public static class JoinDTO{
		
//		@NotBlank @Email //@Size(min=10, max=20)
		private String userEmail;
		
//		@NotBlank //@Size(min=10, max=20)
		private String password1;
		
//		@NotBlank //@Size(min=10, max=20)
		private String password2;
		
//		@NotBlank //@Size(min=10, max=20)
		private String username;
		
//		@NotBlank //@Size(min = 11, max = 11)
		private String tel;
		
	}
	
	


}
