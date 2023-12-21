package com.tenco.indiepicter.chat;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.tenco.indiepicter.chat.response.OpenMovieChatDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatService {

	@Autowired
	private ChatRepository chatRepository;

	public void startChat(String movieTitle) {
		// 2시간 뒤 끝내기 (진짜 할때는 HOURS로 바꿔주세요!)
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.schedule(() -> endChat(movieTitle), 2, TimeUnit.SECONDS); //HOURS
	}
	
	public void endChat(String movieTitle) {
		log.debug("-----------채팅 종료------------");
		// 채팅 종료를 해줘야함
    }

	public List<OpenMovieChatDTO> findByOpenMovie() {

		return null;
	}
}
