package com.tenco.indiepicter.funding.request;

import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
public class AdminRequestFundingUpdateFormDTO {
    private Integer fundingId;
    private Integer movieId;
    private Integer movieStaffId;
    private Integer moviePhotoId;
//    @NotEmpty(message = "목표금액은 비어있을 수 없습니다.")
    private Integer targetPrice;
    private Integer pricePerOnetime;
    private MultipartFile movieThumbnail;
//    @NotEmpty(message = "영화 제목은 비어있을 수 없습니다.")
    private String movieTitle;
//    @NotEmpty(message = "배급사는 비어있을 수 없습니다.")
    private String production;
//    @NotEmpty(message = "제작년도는 비어있을 수 없습니다.")
    private String makeYear;
    private String genre;
//    @NotEmpty(message = "출연배우는 비어있을 수 없습니다.")
    private List<String> actors;
//    @NotEmpty(message = "출연배우(역할)은 비어있을 수 없습니다.")
    private List<String> actorRoles;
//    @NotEmpty(message = "펀딩개시일은 비어있을 수 없습니다.")
    private String fundingPeriodStart;
//    @NotEmpty(message = "펀딩종료일은 비어있을 수 없습니다.")
    private String fundingPeriodEnd;
//    @NotEmpty(message = "상영예정일은 비어있을 수 없습니다.")
    private String dDay;
    private String runningGrade;
//    @NotEmpty(message = "시놉시스는 비어있을 수 없습니다.")
    private String synopsis;
//    @NotEmpty(message = "연출의도는 비어있을 수 없습니다.")
    private String directingIntension;
    private MovieStaff staff;
//    @NotEmpty(message = "영화 포토는 최소 1장이상 등록하셔야합니다.")
    private List<MultipartFile> moviePhotos;
    private String moviePhotoIds;
//    @NotEmpty(message = "감독 사진을 등록해주세요.")
    private MultipartFile directorPhoto;
//    @NotEmpty(message = "감독 경력은 비어있을 수 없습니다.")
    private List<String> directorCareers;
//    @NotEmpty(message = "감독 경력(연도)는 비어있을 수 없습니다.")
    private List<String> directorCareerYears;
//    @NotEmpty(message = "영화제 수상 경력은 비어있을 수 없습니다.")
    private List<String> directorAwards;
//    @NotEmpty(message = "영화제 수상 경력(연도)는 비어있을 수 없습니다.")
    private List<String> directorAwardYears;
}
