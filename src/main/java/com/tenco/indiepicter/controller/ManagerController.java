package com.tenco.indiepicter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	
	@GetMapping("/main")
	public String main() {
		
		return "manager/main";
	}
	
	@GetMapping("/chatting")
	public String chatting() {
		
		return "manager/chatting";
	}
	
	@GetMapping("/invitation")
	public String invitation() {
		
		return "manager/invitation";
	}
	
	@GetMapping("/playday")
	public String playday() {
		
		return "manager/playday";
	}
	
	@GetMapping("/register")
	public String register() {
		
		return "manager/register";
	}
	
	@GetMapping("/reviewr")
	public String review() {
		
		return "manager/review";
	}
	
	@GetMapping("/update_delete")
	public String updateDelete() {
		
		return "manager/update_delete";
	}
	
	
	
}
