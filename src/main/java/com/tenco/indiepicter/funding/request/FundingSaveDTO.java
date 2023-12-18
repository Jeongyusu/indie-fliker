package com.tenco.indiepicter.funding.request;

import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
public class FundingSaveDTO {
    private Integer targetPrice;
    private Integer pricePerOnetime;
    private MultipartFile movieThumbnail; //체크
    private String movieTitle; // 체크
    private String production; //
    private String makeYear; //
    private String genre; //
    private List<String> actors;
    private List<String> actorRoles;
    private String fundingPeriodStart; //
    private String fundingPeriodEnd; //
    private String dDay; //
    private String runningGrade; //체크
    private String synopsis;//
    private String directingIntension; //
    private MovieStaff staff; //
    private List<MultipartFile> moviePhotos; //
    private MultipartFile directorPhoto; //
    private List<String> directorCareers; //
    private List<String> directorCareerYears; //
    private List<String> directorAwards; //
    private List<String> directorAwardYears; //



}
