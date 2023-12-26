package com.tenco.indiepicter.funding.request;

import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class AdminRequestFundingUpdateFormDTO {
    private Integer fundingId;
    private Integer movieId;
    private Integer movieStaffId;
    private Integer moviePhotoId;
    private Integer targetPrice;
    private Integer pricePerOnetime;
    private MultipartFile movieThumbnail;
    private String movieTitle;
    private String production;
    private String makeYear;
    private String genre;
    private List<String> actors;
    private List<String> actorRoles;
    private String fundingPeriodStart;
    private String fundingPeriodEnd;
    private String dDay;
    private String runningGrade;
    private String synopsis;
    private String directingIntension;
    private MovieStaff staff;
    private List<MultipartFile> moviePhotos;
    private MultipartFile directorPhoto;
    private List<String> directorCareers;
    private List<String> directorCareerYears;
    private List<String> directorAwards;
    private List<String> directorAwardYears;
}
