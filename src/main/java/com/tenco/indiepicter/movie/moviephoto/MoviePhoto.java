package com.tenco.indiepicter.movie.moviephoto;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MoviePhoto {
    private Integer id;
    private String moviePic;
    private Integer movieId;

    @Builder
    public MoviePhoto(Integer id, String moviePic, Integer movieId) {
        this.id = id;
        this.moviePic = moviePic;
        this.movieId = movieId;
    }
}
