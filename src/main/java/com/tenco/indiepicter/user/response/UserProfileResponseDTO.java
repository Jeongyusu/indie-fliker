package com.tenco.indiepicter.user.response;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserProfileResponseDTO {
	
	private String id;
	private String pic;
	private String username;
	private String password;

}
