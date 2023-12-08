package com.tenco.indiepicter.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/chat")
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
    @PostMapping("/open")
    public String openChatRoom(@RequestParam String movieTitle) {
    	
    	System.out.println("Movie Title: " + movieTitle);    	
    	chatService.startChat(movieTitle);
    	
        return "{\"movieTitle\": \"" + movieTitle + "\"}";
    }
    
    @PostMapping("/close")
    public String closeChatRoom(@RequestParam String movieTitle) {
    	
    	System.out.println("Movie Title: " + movieTitle);    	
    	chatService.startChat(movieTitle);
    	
        return "{\"movieTitle\": \"" + movieTitle + "\"}";
    }
	
}