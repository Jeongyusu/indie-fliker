package com.tenco.indiepicter.user.request;

import lombok.Data;

@Data
public class UserProfileRequestDTO {

	private String pic;
	private String userEmail;
	private String password;
	private String userDisciption;
	
}
