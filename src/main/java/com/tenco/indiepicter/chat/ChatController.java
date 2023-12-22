package com.tenco.indiepicter.chat;


import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.chat.response.OpenMovieChatDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private HttpSession session;

    @GetMapping("/open-movie")
    public String openMovieChatRoom(Model model) {

       	// 인증검사 필요!!! (로그인 인증 & vip인증?)
    	User principal = (User) session.getAttribute(Define.PRINCIPAL);
        if(!principal.getGrade().equals("VIP")){
            throw new MyDynamicException("VIP 회원만 입장 가능합니다.", HttpStatus.BAD_REQUEST);
        }

        // 영화정보 필요합니다! (model로 던져서 chatroom.jsp도 바꿔줘야함
        List<OpenMovieChatDTO> openMovieChatDTOs = chatService.findByOpenMovie();
        for (OpenMovieChatDTO openMovieChatDTO : openMovieChatDTOs){
            System.out.println("오늘 개봉 영화 정보 : " + openMovieChatDTO.toString());
        }

        model.addAttribute("openMovieChatDTOs", openMovieChatDTOs);
        model.addAttribute("principal", principal);
        return "main/chatroom";
    }
    
}
