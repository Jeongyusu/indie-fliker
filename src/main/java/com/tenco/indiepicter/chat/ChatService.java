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
@Service
public class ChatService {
	
	@Autowired
    private RestTemplate restTemplate;
	
	public void startChat(String movieTitle) {
		// movietitle을 api로 보내야함. (일반에서 열기 때문)
		
		// firestore에 저장해야함 { 영화제목, 오픈시간 }
		
		
		// 끝내기
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.schedule(() -> endChat(movieTitle), 2, TimeUnit.SECONDS); //HOURS
	}
	
	public void endChat(String movieTitle) {
        System.out.println("-------------채팅끝-------------");
        
        // controller 대신 여기서 post로 보내줄거임
        String apiUrl = "https://localhost:80/api/chat/close";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String jsonBody = "{\"movieTitle\": \"" + movieTitle + "\"}";

        HttpEntity<String> requestEntity = new HttpEntity<>(jsonBody, headers);
        
        // POST 요청
        restTemplate.postForObject(apiUrl, requestEntity, String.class);
    }
	
}
