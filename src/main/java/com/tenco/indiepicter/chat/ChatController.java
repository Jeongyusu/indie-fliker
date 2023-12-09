package com.tenco.indiepicter.chat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ChatController {

    @GetMapping("/chatroom/{movieTitle}")
    public String enterChatroom(@PathVariable String movieTitle, Model model) {
    	
    	// 인증검사 필요합니다!!! (로그인 인증 & vip인증?)
    	
    	// 영화정보 필요합니다! (chatroom도 바꿔줘야합니다.)

        return "main/chatroom";
    }
}
