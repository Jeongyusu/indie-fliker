package com.tenco.indiepicter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerController {

	
	@GetMapping
	public String main() {
		
		return "manager/manager_main";
	}
	
	
	
}
