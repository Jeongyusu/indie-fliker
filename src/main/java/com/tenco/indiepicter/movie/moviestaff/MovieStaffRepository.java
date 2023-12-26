package com.tenco.indiepicter.movie.moviestaff;

import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.response.AdminFundingUpdateFormDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieStaffRepository {
    public int saveMovieStaff(MovieStaff movieStaff);

    public int updateById(MovieStaff movieStaff);
}
