package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter.movie.moviephoto.MoviePhoto;
import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
import lombok.Data;

import java.util.List;

@Data
public class AdminFundingUpdateFormDTO {
    private Integer fundingId; //
    private Integer movieId; //
    private Integer movieStaffId;//
    private Integer moviePhotoId;//
    private Integer targetPrice; //
    private Integer pricePerOnetime;//
    private String movieThumbnail;//
    private String movieName;//
    private String production;//
    private String makeYear;//
    private String genre;//
    private String actor;//
    private String fundingReleaseDate;//
    private String fundingEndDate;//
    private String dDay;//
    private String runningGrade;//
    private String synopsis;//
    private String directingIntension;//
    private MovieStaff staff;//
    private String moviePhotos;
    private String directorPhoto;//
    private String directorCareers;//
    private String directorAwards;//

}
