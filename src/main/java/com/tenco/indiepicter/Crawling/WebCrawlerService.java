package com.tenco.indiepicter.Crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class WebCrawlerService {

    private final RestTemplate restTemplate;
    private final MovieMapper movieMapper;

    @Autowired
    public WebCrawlerService(RestTemplate restTemplate, MovieMapper movieMapper) {
        this.restTemplate = restTemplate;
        this.movieMapper = movieMapper;
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveCrawlingDataToDB(String url) {
        List<MovieCrawl> movieCrawlList = crawlPage(url);

        // MovieCrawl 객체 목록 로깅
        movieCrawlList.forEach(movieCrawl -> System.out.println("MovieCrawl: " + movieCrawl));

        // 크롤링한 데이터를 Entity로 변환하여 MyBatis를 통해 DB에 저장
        for (MovieCrawl movieCrawl : movieCrawlList) {
            // 중복된 데이터 방지
            if (movieMapper.countMovies(movieCrawl) == 0) {
                try {
                    movieMapper.insertMovie(movieCrawl);
                    System.out.println("저장된 영화 데이터: " + movieCrawl);
                } catch (Exception e) {
                    // 삽입 중에 발생하는 예외 로깅
                    System.err.println("영화 데이터 삽입 중 오류: " + movieCrawl);
                    e.printStackTrace();
                }
            }
        }
    }

    public List<MovieCrawl> crawlPage(String url) {
        String htmlContent = restTemplate.getForObject(url, String.class);

        // Jsoup을 사용하여 HTML 파싱
        Document document = Jsoup.parse(htmlContent);

        // 원하는 클래스를 가진 요소를 선택
        Elements elements = document.select(".db_list");

        // 결과를 담을 리스트
        List<MovieCrawl> movieCrawlList = new ArrayList<>();

        // 영화 정보를 추출하는 부분
        for (Element element : elements) {
            // 추출한 정보를 이용하여 Movie 객체를 생성하고 리스트에 추가
            MovieCrawl movieCrawl = extractMovieData(element);
            movieCrawlList.add(movieCrawl);
        }

        return movieCrawlList;
    }

    // 데이터 파싱
    private MovieCrawl extractMovieData(Element element) {
        String title = getElementText(element, ".title a");
        String productionYear = getElementText(element, ".info dl:nth-child(1) dd");
        String genre = getElementText(element, ".info dl:nth-child(2) dd");
        String director = getElementText(element, ".info dl:nth-child(3) dd");
        String cast = getElementText(element, ".info dl:nth-child(4) dd");
        String productionCompany = getElementText(element, ".info dl:nth-child(5) dd");
        String distributionCompany = getElementText(element, ".info dl:nth-child(6) dd");

        return new MovieCrawl(title, productionYear, genre, director, cast, productionCompany, distributionCompany);
    }

    private String getElementText(Element element, String selector) {
        Element selectedElement = element.selectFirst(selector);
        return (selectedElement != null) ? selectedElement.text() : null;
    }
}
