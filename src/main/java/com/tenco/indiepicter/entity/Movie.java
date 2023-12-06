package com.tenco.indiepicter.entity;

import lombok.Builder;
import lombok.Data;

@Data
public class Movie {
    private String title;
    private String productionYear;
    private String genre;
    private String director;
    private String cast;
    private String productionCompany;
    private String distributionCompany;
   
    
    @Builder
    public Movie(String title, String productionYear, String genre, String director,
            String cast, String productionCompany, String distributionCompany) {
   this.title = title;
   this.productionYear = productionYear;
   this.genre = genre;
   this.director = director;
   this.cast = cast;
   this.productionCompany = productionCompany;
   this.distributionCompany = distributionCompany;
 
}

}