package com.tenco.indiepicter.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ChatController {
	
    @PostMapping("/chatroom")
    public String enterChatroom(@RequestBody String movieTitle) {
    	
    	// 인증검사 필요!!! (로그인 인증 & vip인증?)
    	
    	// 영화정보 필요합니다! (model로 던져서 chatroom.jsp도 바꿔줘야함)

        return "main/chatroom";
    }
    
}
