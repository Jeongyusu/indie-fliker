package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter.movie.moviephoto.MoviePhoto;
import com.tenco.indiepicter.movie.moviestaff.MovieStaff;
import lombok.Data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
    private String moviePhotoIds;
    private String directorPhoto;//
    private String directorCareers;//
    private String directorAwards;//

    public List<String> splitStringToList(String input) {
        return Arrays.asList(input.split(","));
    }

    public List<String> splitStringToListCustom(String input){
        return Arrays.asList(input.split("</br>"));
    }

    public List<String> extractNames() {
        List<String> inputList = splitStringToListCustom(this.directorCareers);
        List<String> names = new ArrayList<>();

        Pattern p = Pattern.compile("\\[(.*?)\\]");
        for (String input : inputList) {
            Matcher m = p.matcher(input);
            while (m.find()) {
                names.add(m.group(1).trim());
            }
        }

        return names;
    }

    public List<String> extractYears() {
        List<String> inputList = splitStringToListCustom(this.directorCareers);
        List<String> years = new ArrayList<>();
        Pattern p = Pattern.compile("\\((.*?)\\)");
        for (String input : inputList) {
            Matcher m = p.matcher(input);
            while (m.find()) {
                years.add(m.group(1).trim());
            }
        }

        return years;
    }

    public List<String> extractAwardTitles() {
        List<String> inputList = splitStringToListCustom(this.directorAwards);
        List<String> titles = new ArrayList<>();
        Pattern pattern = Pattern.compile("(.+?)\\(\\d+\\)");
        for (String input : inputList) {
            Matcher m = pattern.matcher(input);
            while (m.find()) {
                titles.add(m.group(1).trim());
            }
        }
        return titles;
    }

    public List<String> extractAwardYears() {
        List<String> inputList = splitStringToListCustom(this.directorAwards);
        List<String> years = new ArrayList<>();
        Pattern pattern = Pattern.compile("\\((\\d+)\\)");
        for (String input : inputList) {
            Matcher m = pattern.matcher(input);
            while (m.find()) {
                years.add(m.group(1).trim());
            }
        }
        return years;
    }

    public List<List<String>> parseActor() {
        List<List<String>> resultList = new ArrayList<>();

        String[] tokens = this.actor.split(",");
        Pattern pattern = Pattern.compile("(.+?)(?:\\((.*?)\\))?");

        List<String> firstPartList = new ArrayList<>();
        List<String> secondPartList = new ArrayList<>();

        for (String token : tokens) {
            Matcher matcher = pattern.matcher(token.trim());
            if (matcher.matches()) {
                firstPartList.add(matcher.group(1));
                String secondPart = matcher.group(2);
                secondPartList.add((secondPart != null ? secondPart : "미정"));
            }
        }

        resultList.add(firstPartList);
        resultList.add(secondPartList);

        return resultList;
    }


}
