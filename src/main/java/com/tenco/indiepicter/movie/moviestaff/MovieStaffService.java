package com.tenco.indiepicter.movie.moviestaff;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MovieStaffService {

    @Autowired
    private MovieStaffRepository movieStaffRepository;

    @Transactional
    public int saveMovieStaff(FundingSaveDTO fundingSaveDTO, Integer movieId){

        MovieStaff movieStaff = MovieStaff.builder()
                .director(fundingSaveDTO.getStaff().getDirector())
                .filming(fundingSaveDTO.getStaff().getFilming())
                .art(fundingSaveDTO.getStaff().getArt())
                .sound(fundingSaveDTO.getStaff().getSound())
                .clothes(fundingSaveDTO.getStaff().getClothes())
                .script(fundingSaveDTO.getStaff().getScript())
                .lighting(fundingSaveDTO.getStaff().getLighting())
                .editing(fundingSaveDTO.getStaff().getEditing())
                .music(fundingSaveDTO.getStaff().getMusic())
                .movieId(movieId)
                .build();

        int resultRowCount = movieStaffRepository.saveMovieStaff(movieStaff);
        if(resultRowCount != 1) {
            throw new MyDynamicException("무비 스태프 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }
}
