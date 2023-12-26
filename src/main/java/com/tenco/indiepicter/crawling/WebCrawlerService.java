package com.tenco.indiepicter.crawling;

import com.tenco.indiepicter.movie.Movie;
import com.tenco.indiepicter.movie.moviephoto.MoviePhoto;
import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Slf4j
@Service
public class WebCrawlerService {

    private final RestTemplate restTemplate;
    private final MovieCrawlRepository movieCrawlRepository;

    @Autowired
    public WebCrawlerService(RestTemplate restTemplate, MovieCrawlRepository movieCrawlRepository) {
        this.restTemplate = restTemplate;
        this.movieCrawlRepository = movieCrawlRepository;
    }


    @Transactional(rollbackFor = Exception.class)
    public List<MovieCrawl> saveCrawlingDataToDB(String domain, String path) {
        int maxPage = 1; // 여기서 데이터 값 조정

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


            Movie movie = Movie.builder()
                    .makeYear(movieCrawl.getMakeYear())
                    .production(movieCrawl.getProduction())
                    .movieName(movieCrawl.getMovieName())
                    .synopsis(movieCrawl.getSynopsis())
                    .thumbnail(movieCrawl.getThumbnail())
                    .directingIntension(movieCrawl.getDirectingIntension())
                    .genre(movieCrawl.getGenre())
                    .runningGrade(movieCrawl.getRunningGrade())
                    .director(movieCrawl.getEDirector())
                    .directorPic(null)
                    .actor(movieCrawl.getActor())
                    .directorCareers(movieCrawl.getDirectorCareers())
                    .directorAwardsFilm(movieCrawl.getDirectorAwardsFilm())
                    .build();


            // 중복된 데이터 방지
            if (movieCrawlRepository.countMovies(movieCrawl) == 0) {
                try {
                    movieCrawlRepository.deletedummy();
                    movieCrawlRepository.insertMovie(movie);
                    Integer moviePk = movie.getId();

                    MovieStaff movieStaff = MovieStaff.builder()
                            .director(movieCrawl.getEDirector())
                            .filming(movieCrawl.getFilming())
                            .art(movieCrawl.getArt())
                            .sound(movieCrawl.getSound())
                            .clothes(movieCrawl.getClothes())
                            .script(movieCrawl.getScript())
                            .lighting(movieCrawl.getLighting())
                            .editing(movieCrawl.getEditing())
                            .music(movieCrawl.getMusic())
                            .movieId(moviePk)
                            .build();


                    movieCrawlRepository.insertMovieStaff(movieStaff);


                    // 각 이미지 URL을 따로 저장
                    String[] photoUrls = movieCrawl.getMoviePic().split(", ");
                    List<String> moviePicList = Arrays.asList(photoUrls);

                    for (String photoUrl : moviePicList) {
                        // 각 이미지 URL에 대한 MovieCrawl 객체 생성
                        MovieCrawl photoMovieCrawl = MovieCrawl.builder()
                                .id(movieCrawl.getId())  // 같은 영화에 속한 이미지이므로 같은 ID 사용
                                .moviePic(photoUrl.trim())// 여기서 trim()을 사용하여 공백을 제거합니다.
                                .build();

                        MoviePhoto moviePhoto = MoviePhoto.builder()
                                .moviePic(photoMovieCrawl.getMoviePic())
                                .movieId(moviePk)
                                .build();
                        // 각 이미지 URL을 따로 저장
                        movieCrawlRepository.insertMoviePhoto(moviePhoto);
                    }

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
        String moviePic = extractPhotoUrls(element, domain); // 포토
//        ================================
        Integer movieId = Integer.parseInt(uriComponentsBuilder.build().getQueryParams().get("seq").stream().findFirst().orElse("0"));
        String thumbnail = element.selectFirst(".movie_info_poster img").attr("src");
        String movieName = getElementText(element, ".movie_info_text .subject"); // 제목
        String makeYear = getElementText(element, ".movie_info_text .explain li:nth-child(2)"); // 제작년도
        String genre = getElementText(element, ".movie_info_text .explain li:nth-child(3)"); // 장르
        String runningGrade = getElementText(element, ".movie_info_text .explain li:nth-child(5)"); // 영화등급
        String production = getElementText(element, ".detail dl:has(dt:containsOwn(제작사)) dd"); // 제작사
        String director = getElementText(element, ".detail dl:has(dt:containsOwn(감독)) dd"); // 감독
        String actor = getElementText(element, ".detail dl:has(dt:containsOwn(출연)) dd"); // 출연
        String synopsis = getElementText(element, ".movie_story .library_view_title:containsOwn(시놉시스) + dd"); // 시놉시스
        String directingIntension = getElementText(element, ".movie_story .library_view_title:containsOwn(연출의도) + dd"); // 연출의도

        String directorAwardsFilm = formatDirectorAwardsFilm(element, ".movie_story .library_view_title:containsOwn(영화제 상영 및 수상작) + dd");
        // 영화제 상영 및 수상작

        String directorCareers = extractAndFormatDirectorCareers(element); // 감독 수상경력
        //=================================
        String eDirector = getStaffInfo(element, "감독");
        String filming = getStaffInfo(element, "촬영");
        String art = getStaffInfo(element, "미술");
        String sound = getStaffInfo(element, "사운드");
        String clothes = getStaffInfo(element, "의상");
        String script = getStaffInfo(element, "프로듀서"); // 스크립트
        String lighting = getStaffInfo(element, "조명");
        String editing = getStaffInfo(element, "편집");
        String music = getStaffInfo(element, "음악");


        return MovieCrawl
                .builder()
                .id(movieId)
                .movieName(movieName)
                .makeYear(makeYear)
                .genre(genre)
                .runningGrade(runningGrade)
                .production(production)
                .director(director)
                .actor(actor)
                .synopsis(synopsis)
                .directingIntension(directingIntension)
                .directorAwardsFilm(directorAwardsFilm)
                .directorCareers(directorCareers)
                .thumbnail(domain + thumbnail)
                .moviePic(moviePic.toString())
                .eDirector(eDirector)
                .filming(filming)
                .art(art)
                .sound(sound)
                .production(production)
                .clothes(clothes)
                .script(script)
                .lighting(lighting)
                .editing(editing)
                .music(music)
                .build();
    }

    private String formatDirectorAwardsFilm(Element element, String selector) {
        Elements awardsFilmElements = element.select(selector);
        if (!awardsFilmElements.isEmpty()) {
            String awardsFilm = awardsFilmElements.first().html(); // html() 메서드를 사용하여 HTML 내용을 가져옵니다.
            return formatAwardsFilm(awardsFilm);
        }
        return null;
    }

    private String formatAwardsFilm(String awardsFilm) {

        // awardsFilm 값에서 HTML 태그 및 '\n'을 제거하는 로직 (정규식 사용)
        awardsFilm = awardsFilm.replaceAll("\\<.*?\\>|\n", "");

        // awardsFilm 값을 (년도)를 유지하면서, (년도)가 끝날 때마다 </br>을 추가하는 로직
        awardsFilm = awardsFilm.replaceAll("\\(\\d{4}\\)", "$0</br>");


        return awardsFilm;


    }


    //  감독 작품 경력 정보 추출 및 포맷팅
    private String extractAndFormatDirectorCareers(Element element) {
        Elements directorCareersElements = element.select(".movie_story .library_view_title:containsOwn(감독작품경력) + dd");
        if (!directorCareersElements.isEmpty()) {
            String directorCareers = directorCareersElements.first().html(); // html() 메서드를 사용하여 HTML 내용을 가져옵니다.
            return formatDirectorCareers(directorCareers);
        }
        return null; // 또는 적절한 디폴트 값으로 처리
    }

    // 감독 작품 경력 정보 포맷팅
    private String formatDirectorCareers(String directorCareers) {
        // 정규 표현식을 사용하여 감독 작품 경력 정보 포맷팅
        String formattedCareers = directorCareers.replaceAll("<br>", " ");

        // 중복된 괄호를 하나로 줄이기
        formattedCareers = formattedCareers.replaceAll("\\[\\[", "[").replaceAll("\\]\\]", "]");

        // 정상적인 괄호를 찾아서 하나로 합치기
        Pattern pattern = Pattern.compile("\\[([^\\[\\]]+)\\]\\(([^\\[\\]]+)\\)");
        Matcher matcher = pattern.matcher(formattedCareers);
        StringBuilder resultBuilder = new StringBuilder();
        while (matcher.find()) {
            String title = matcher.group(1);
            String year = matcher.group(2);
            resultBuilder.append("[").append(title).append("]").append("(").append(year).append(")</br> ");
        }

        return resultBuilder.toString().trim();
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
