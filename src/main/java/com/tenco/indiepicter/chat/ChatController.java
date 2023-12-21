package com.tenco.indiepicter.chat;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;


    @GetMapping ("/open-movie")
    public String openMovieChatRoom() {
    	
    	// 인증검사 필요!!! (로그인 인증 & vip인증?)
    	
    	// 영화정보 필요합니다! (model로 던져서 chatroom.jsp도 바꿔줘야함
        return "main/chatroom";
    }
    
}
