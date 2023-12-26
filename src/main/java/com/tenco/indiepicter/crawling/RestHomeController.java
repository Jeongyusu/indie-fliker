package com.tenco.indiepicter.crawling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



import java.util.List;

@RestController
public class RestHomeController {

    @Autowired
    private WebCrawlerService webCrawlerService;
    // http://localhost/ctest1 < 반드시 먼저 실행
    // http://localhost:80/api-webcrawler
    @GetMapping("/api-webcrawler")
    public List<MovieCrawl> testCrawl() {
        // 크롤링 주소 사이트
        List<MovieCrawl> result = webCrawlerService.saveCrawlingDataToDB(
                "https://indieground.kr",
                "/indie/dbList.do"
        );

        return result;
    }
}
