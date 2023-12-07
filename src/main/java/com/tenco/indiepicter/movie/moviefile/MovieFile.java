package com.tenco.indiepicter.movie.moviefile;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class MovieFile {
    private Integer id;
    private String originName;
    private String path;
    private String fileName;
    private String graphics;
    private Boolean hasSubtitles;
    private String fileType;
    private String fileSize;
    private Integer movieId;


    @Builder
    public MovieFile(Integer id, String originName, String path, String fileName, String graphics, Boolean hasSubtitles, String fileType, String fileSize, Integer movieId) {
        this.id = id;
        this.originName = originName;
        this.path = path;
        this.fileName = fileName;
        this.graphics = graphics;
        this.hasSubtitles = hasSubtitles;
        this.fileType = fileType;
        this.fileSize = fileSize;
        this.movieId = movieId;
    }
}
