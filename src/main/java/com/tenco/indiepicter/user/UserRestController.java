package com.tenco.indiepicter.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	//--------------------------------------------------------------------------------------------------------------
		// 아이디 중복 체크
		@PostMapping("/emailCkeck")
		@ResponseBody
		public int emailCkeck(String userEmail) throws Exception{
		 
			int result = this.userService.findByEmailCheck(userEmail);
			
			return result;
		}
	//--------------------------------------------------------------------------------------------------------------


}
