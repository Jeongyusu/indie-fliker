package com.tenco.indiepicter.chat;

import java.text.SimpleDateFormat;
import java.util.Date;

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
    	// 영화채팅방 오픈시키기
    	chatService.startChat(movieTitle);
    	
    	// 오픈된 영화정보 { movieTitle, startTime }
    	Date currentDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm:ss");
	    String startTime = sdf.format(currentDate);
    	
        return "{\"movieTitle\": \"" + movieTitle + "\", \"startTime\": \"" + startTime + "\"}";
    }

}