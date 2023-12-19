package com.tenco.indiepicter.Crawling;

import lombok.Builder;
import lombok.Data;

@Data
public class MovieCrawl {
    private String title;
    private String productionYear;
    private String genre;
    private String director;
    private String cast;
    private String productionCompany;
    private String distributionCompany;

    @Builder
    public MovieCrawl(String title, String productionYear, String genre, String director, String cast, String productionCompany, String distributionCompany) {
        this.title = (title != null && !title.isEmpty()) ? title : null;
        this.productionYear = (productionYear != null && !productionYear.isEmpty()) ? productionYear : null;
        this.genre = (genre != null && !genre.isEmpty()) ? genre : null;
        this.director = (director != null && !director.isEmpty()) ? director : null;
        this.cast = (cast != null && !cast.isEmpty()) ? cast : null;
        this.productionCompany = (productionCompany != null && !productionCompany.isEmpty()) ? productionCompany : null;
        this.distributionCompany = (distributionCompany != null && !distributionCompany.isEmpty()) ? distributionCompany : null;
    }
}


