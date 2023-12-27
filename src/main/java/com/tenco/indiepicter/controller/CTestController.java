package com.tenco.indiepicter.controller;

import com.tenco.indiepicter.crawling.MovieCrawlRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CTestController {

    @Autowired
    private MovieCrawlRepository movieCrawlRepository;

    // localhost:80/ctest
    // 크롤링 api 서버 실행 전 실행
    @GetMapping("/ctest1")
    public String ctest() {
        movieCrawlRepository.deleteDummyMovieData();
        movieCrawlRepository.resetAutoIncrement();
        return "데이터 삭제 완료 및 초기화 ";
    }


}
