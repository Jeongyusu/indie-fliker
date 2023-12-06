package com.tenco.indiepicter.service;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.tenco.indiepicter.entity.Movie;

import java.util.ArrayList;
import java.util.List;

@Service
public class WebCrawlerService {

    private final RestTemplate restTemplate;

    @Autowired
    public WebCrawlerService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<Movie> crawlPage(String url) {
        String htmlContent = restTemplate.getForObject(url, String.class);

        // Jsoup을 사용하여 HTML 파싱
        Document document = Jsoup.parse(htmlContent);

        // 원하는 클래스를 가진 요소를 선택
        Elements elements = document.select(".db_list");

        // 선택된 요소들을 출력해보기
//        System.out.println("Selected elements: " + elements);

        // 결과를 담을 리스트
        List<Movie> movieList = new ArrayList<>();

        // 영화 정보를 추출하는 부분
        for (Element element : elements) {
            Element titleElement = element.selectFirst(".title a");
            String title = titleElement != null ? titleElement.text() : null;

            Element productionYearElement = element.selectFirst(".info dl:nth-child(1) dd");
            String productionYear = productionYearElement != null ? productionYearElement.text() : null;

            Element genreElement = element.selectFirst(".info dl:nth-child(2) dd");
            String genre = genreElement != null ? genreElement.text() : null;

            Element directorElement = element.selectFirst(".info dl:nth-child(3) dd");
            String director = directorElement != null ? directorElement.text() : null;

            Element castElement = element.selectFirst(".info dl:nth-child(4) dd");
            String cast = castElement != null ? castElement.text() : null;

            Element productionCompanyElement = element.selectFirst(".info dl:nth-child(5) dd");
            String productionCompany = productionCompanyElement != null ? productionCompanyElement.text() : null;

            Element distributionCompanyElement = element.selectFirst(".info dl:nth-child(6) dd");
            String distributionCompany = distributionCompanyElement != null ? distributionCompanyElement.text() : null;

            // 추출한 정보를 이용하여 Movie 객체를 생성하고 리스트에 추가
            
            Movie movie = new Movie(title, productionYear, genre, director, cast, productionCompany, distributionCompany);
            movieList.add(movie);
        }

        return movieList;
    }
}