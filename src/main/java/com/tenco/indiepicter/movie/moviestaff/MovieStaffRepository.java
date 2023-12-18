package com.tenco.indiepicter.movie.moviestaff;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieStaffRepository {
    public int saveMovieStaff(MovieStaff movieStaff);
}
