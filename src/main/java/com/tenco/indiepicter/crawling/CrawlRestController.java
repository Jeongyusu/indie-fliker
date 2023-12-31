package com.tenco.indiepicter.crawling;

import com.tenco.indiepicter.runningschedule.RunningScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



import java.util.List;

@RestController
public class CrawlRestController {
    @Autowired
    private MovieCrawlRepository movieCrawlRepository;

    @Autowired
    private WebCrawlerService webCrawlerService;

    @Autowired
    private RunningScheduleService runningScheduleService;

    // http://localhost/crawl-ready < 반드시 먼저 실행
    @GetMapping("/crawl-ready")
    public String crawlReady() {
        movieCrawlRepository.deleteDummyMovieData();
        movieCrawlRepository.resetAutoIncrement();
        return "데이터 삭제 완료 및 초기화 ";
    }
    // http://localhost:80/api-webcrawler
    @GetMapping("/api-webcrawler")
    public List<MovieCrawl> testCrawl() {
        // 크롤링 주소 사이트
        List<MovieCrawl> result = webCrawlerService.saveCrawlingDataToDB(
                "https://indieground.kr",
                "/indie/dbList.do"
        );
        runningScheduleService.insertRunningSchedule();

        return result;
    }
}
