package com.tenco.indiepicter.banner;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class Banner {
    Integer id;
    String bannerPic;
    String genre;
    Integer movieId;
    Timestamp createdAt;

    @Builder
    public Banner(Integer id, String bannerPic, String genre, Integer movieId, Timestamp createdAt) {
        this.id = id;
        this.bannerPic = bannerPic;
        this.genre = genre;
        this.movieId = movieId;
        this.createdAt = createdAt;
    }
}
