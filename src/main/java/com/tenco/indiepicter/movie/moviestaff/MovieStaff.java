package com.tenco.indiepicter.movie.moviestaff;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MovieStaff {
    Integer id;
    String director;
    String filming;
    String art;
    String sound;
    String clothes;
    String script;
    String lighting;
    String editing;
    String music;
    Integer movieId;

    @Builder
    public MovieStaff(Integer id, String director, String filming, String art, String sound, String clothes, String script, String lighting, String editing, String music, Integer movieId) {
        this.id = id;
        this.director = director;
        this.filming = filming;
        this.art = art;
        this.sound = sound;
        this.clothes = clothes;
        this.script = script;
        this.lighting = lighting;
        this.editing = editing;
        this.music = music;
        this.movieId = movieId;
    }
}
