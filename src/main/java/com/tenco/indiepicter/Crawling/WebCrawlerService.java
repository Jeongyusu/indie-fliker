package com.tenco.indiepicter.Crawling;

import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

@Slf4j
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
    public List<MovieCrawl> saveCrawlingDataToDB(String domain, String path) {
        int maxPage = 5;

        List<MovieCrawl> movieCrawlList = new ArrayList<>();
        for (int i = 1; i <= maxPage; i++) {
            String listPageHtmlContent = restTemplate.getForObject(domain + path + "?page=" + i, String.class);
            Document listPageDocument = Jsoup.parse(listPageHtmlContent);
            Elements elements = listPageDocument.select(".db_list");
            for (Element element : elements) {
                // 상세 링크
                String detailHref = element.selectFirst(".title a").attr("href");
                String detailHtmlContent = restTemplate.getForObject(domain + detailHref, String.class);
                Document detailDocument = Jsoup.parse(detailHtmlContent);
                Elements detailElements = detailDocument.select(".library_view");
                Element libraryViewElement = detailElements.get(0);
                // 무비 데이터 파싱, 객체 만들기
                MovieCrawl movieCrawl = extractMovieData(libraryViewElement, domain, detailHref);
                movieCrawlList.add(movieCrawl);
            }
        }

        // 크롤링한 데이터를 Entity로 변환하여 MyBatis를 통해 DB에 저장
        for (MovieCrawl movieCrawl : movieCrawlList) {
            // 중복된 데이터 방지
            if (movieMapper.countMovies(movieCrawl) == 0) {
                try {
                    movieMapper.insertMovie(movieCrawl);
                    log.info("저장된 영화 데이터: {}", movieCrawl);
                } catch (Exception e) {
                    // 삽입 중에 발생하는 예외 로깅
                    log.error("영화 데이터 삽입 중 오류: {}", movieCrawl, e);
                }
            }
        }

        return movieCrawlList;
    }
    private String extractPhotoUrls(Element element, String domain) {
        List<String> photoUrls = new ArrayList<>();

        Elements photoElements = element.select(".stillcut_img img");
        for (Element photoElement : photoElements) {
            String relativePath = photoElement.attr("src");

            // .png 파일이 아닌 경우에만 추가
            if (!relativePath.endsWith(".png")) {
                String absolutePath = domain + relativePath;
                photoUrls.add(absolutePath);
            }
        }

        // photoUrls를 JSON 형식의 문자열로 변환 (대괄호 []를 제거)
        return photoUrls.toString().replaceAll("[\\[\\]]", "");
    }

    // 데이터 파싱

    private MovieCrawl extractMovieData(Element element, String domain, String path) {
        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromUriString(domain + path);
        String photoUrls = extractPhotoUrls(element, domain);
        Integer movieId = Integer.parseInt(uriComponentsBuilder.build().getQueryParams().get("seq").stream().findFirst().orElse("0"));
        String imageUrl = element.selectFirst(".movie_info_poster img").attr("src");
        String title = getElementText(element, ".movie_info_text .subject"); // 제목
        String englishName = getElementText(element, ".movie_info_text .explain li:nth-child(1)"); // 영어 제목
        String year = getElementText(element, ".movie_info_text .explain li:nth-child(2)"); // 제작년도
        String genre = getElementText(element, ".movie_info_text .explain li:nth-child(3)"); // 장르
        String duration = getElementText(element, ".movie_info_text .explain li:nth-child(4)"); // 상영시간
        String rating = getElementText(element, ".movie_info_text .explain li:nth-child(5)"); // 영화등급
        String color = getElementText(element, ".movie_info_text .explain li:nth-child(6)"); // 컬러
        String productionCompany = getElementText(element, ".movie_info_text .detail dl:nth-child(1) dd"); // 제작사
        String distributionCompany = getElementText(element, ".movie_info_text .detail dl:nth-child(2) dd");  // 배급사
        String director = getElementText(element, ".movie_info_text .detail dl:nth-child(3) dd"); // 감독
        String cast = getElementText(element, ".movie_info_text .detail dl:nth-child(4) dd"); // 출연
        String keywords = getElementText(element, ".movie_info_text .detail dl:nth-child(5) dd a"); // 키워드
        String synopsis = getElementText(element, ".movie_story .library_view_title:containsOwn(시놉시스) + dd"); // 시놉시스
        String directorIntention = getElementText(element, ".movie_story .library_view_title:containsOwn(연출의도) + dd"); // 연출의도
        String screeningAndAwards = getElementText(element, ".movie_story .library_view_title:containsOwn(영화제 상영 및 수상작) + dd"); // 영화제 상영 및 수상작
        String directorFilmography = getElementText(element, ".movie_story .library_view_title:containsOwn(감독작품경력) + dd"); // 감독작품 경력
        String screenplay = getStaffInfo(element, "각본");
        String production = getStaffInfo(element, "제작");
        String producer = getStaffInfo(element, "프로듀서");
        String filming = getStaffInfo(element, "촬영");
        String lighting = getStaffInfo(element, "조명");
        String art = getStaffInfo(element, "미술");
        String editing = getStaffInfo(element, "편집");
        String recording = getStaffInfo(element, "동시녹음");
        String sound = getStaffInfo(element, "사운드");
        String music = getStaffInfo(element, "음악");
        String clothes = getStaffInfo(element, "의상");
        String dressing = getStaffInfo(element, "분장");
        return MovieCrawl.builder()
                .id(movieId)
                .title(title)
                .englishName(englishName)
                .year(year)
                .genre(genre)
                .duration(duration)
                .rating(rating)
                .color(color)
                .productionCompany(productionCompany)
                .distributionCompany(distributionCompany)
                .director(director)
                .cast(cast)
                .keywords(keywords)
                .synopsis(synopsis)
                .directorIntention(directorIntention)
                .screeningAndAwards(screeningAndAwards)
                .directorFilmography(directorFilmography)
                .imageUrl(domain + imageUrl)
                .photoUrls(photoUrls.toString())
                .screenplay(screenplay)
                .production(production)
                .producer(producer)
                .filming(filming)
                .lighting(lighting)
                .art(art)
                .editing(editing)
                .recording(recording)
                .sound(sound)
                .music(music)
                .clothes(clothes)
                .dressing(dressing)
                .build();
    }

    private String getStaffInfo(Element element, String staffRole) {
        Elements rows = element.select("table tbody tr");
        for (Element row : rows) {
            Elements columns = row.select("th, td");
            for (int i = 0; i < columns.size(); i += 2) {
                String role = columns.get(i).text();
                if (role.equals(staffRole)) {
                    return columns.get(i + 1).text();
                }
            }
        }
        return null;
    }
    private String getElementText(Element element, String selector) {
        Element selectedElement = element.selectFirst(selector);
        return (selectedElement != null) ? selectedElement.text() : null;
    }
}
