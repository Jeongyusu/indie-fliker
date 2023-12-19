package com.tenco.indiepicter.Crawling;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



import java.util.List;

@RestController
public class RestHomeController {

    @Autowired
    private WebCrawlerService webCrawlerService;

    // http://localhost:80/webcrawler-test
    @GetMapping("/webcrawler-test")
    public List<MovieCrawl> testCrawl() {
        // 크롤링 주소 사이트
        String url = "https://indieground.kr/indie/dbList.do";

        webCrawlerService.saveCrawlingDataToDB(url);

        List<MovieCrawl> result = webCrawlerService.crawlPage(url);

        for (MovieCrawl movieCrawl : result) {
            System.out.println(movieCrawl);
        }

        return result;
    }
}