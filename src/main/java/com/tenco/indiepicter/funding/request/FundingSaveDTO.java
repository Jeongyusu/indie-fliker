package com.tenco.indiepicter.funding.request;

import java.sql.Timestamp;
import java.util.List;

public class FundingSaveDTO {
    private String movieThumbnail;
    private String movieTitle;
    private Timestamp fundingPeriodStart;
    private Timestamp fundingPeriodEnd;
    private Timestamp dDay;
    private String runningGrade;
    private String synopsis;
    private String directingIntension;
    private String staff;
    private List<String> moviePhotos;
    private String directorPhoto;
    private List<String> directorCareers;
    private List<String> directorAwards;
}
