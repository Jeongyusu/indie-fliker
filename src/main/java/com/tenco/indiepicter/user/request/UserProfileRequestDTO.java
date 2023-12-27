package com.tenco.indiepicter.user.request;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserProfileRequestDTO {
	private Integer id;
	private String username;
	private String tel;
	private String password1;
	private String password2;
	private MultipartFile file;
	private String originFileName;
	private String uploadFileName;
}
