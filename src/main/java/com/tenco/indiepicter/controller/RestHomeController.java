package com.tenco.indiepicter.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tenco.indiepicter.entity.Movie;
import com.tenco.indiepicter.service.WebCrawlerService;

import java.util.List;

@RestController
public class RestHomeController {

    @Autowired
    private WebCrawlerService webCrawlerService;

    // http://localhost:80/webcrawler-test
    @GetMapping("/webcrawler-test")
    public List<Movie> testCrawl() {
    // 크롤링 주소 사이트
    String url = "https://indieground.kr/indie/dbList.do";
        
    List<Movie> result = webCrawlerService.crawlPage(url);

    for (Movie movie : result) {
            System.out.println(movie);
        }

        return result;
    }
}