package com.tenco.indiepicter.chat;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatService {

    @Autowired
    private RestTemplate restTemplate;
	
	public void startChat(String movieTitle) {
		// firestore에 저장해야함 (chat_records) { 영화제목, 오픈시간 }
		
		
		// 2시간 뒤 끝내기 (진짜 할때는 HOURS로 바꿔주세요!)
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.schedule(() -> endChat(movieTitle), 2, TimeUnit.SECONDS); //HOURS
	}
	
	// POST 로 api/chat/close에 종료된 채팅 영화 보내줌
	public void endChat(String movieTitle) {
		log.debug("-----------채팅 종료------------");
		
        String apiUrl = "http://localhost:80/api/chat/close";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String jsonBody = "{\"movieTitle\": \"" + movieTitle + "\"}";
        HttpEntity<String> requestEntity = new HttpEntity<>(jsonBody, headers);

        restTemplate.postForObject(apiUrl, requestEntity, String.class);

    }
	
}
