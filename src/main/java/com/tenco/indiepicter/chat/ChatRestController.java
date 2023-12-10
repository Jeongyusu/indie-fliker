package com.tenco.indiepicter.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChatRestController {
	
	@Autowired
	private ChatService chatService;
	
    @PostMapping("/api/chat/open")
    public String openChatRoom(@RequestParam String movieTitle) {
    	// 영화채팅방 오픈 (관리자 인증 필요)
    	chatService.startChat(movieTitle);
		return movieTitle;
    }
    
}
