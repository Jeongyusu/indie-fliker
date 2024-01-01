package com.tenco.indiepicter.crawling;

import com.tenco.indiepicter.runningschedule.RunningScheduleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



import java.util.List;

@Slf4j
@RestController
public class CrawlRestController {
    @Autowired
    private MovieCrawlRepository movieCrawlRepository;

    @Autowired
    private WebCrawlerService webCrawlerService;

    @Autowired
    private RunningScheduleService runningScheduleService;

    // http://localhost:80/api-webcrawler
    @GetMapping("/api-webcrawler")
    public List<MovieCrawl> testCrawl() {

        movieCrawlRepository.deleteDummyMovieData();
        movieCrawlRepository.resetAutoIncrement();
        log.info("영화 더미 삭제, pk초기화 완료");

        // 크롤링 주소 사이트
        List<MovieCrawl> result = webCrawlerService.saveCrawlingDataToDB(
                "https://indieground.kr",
                "/indie/dbList.do"
        );
        runningScheduleService.insertRunningSchedule();
        log.info("러닝스케쥴 더미데이터 인서트 완료");
        return result;
    }
}
