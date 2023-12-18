package com.tenco.indiepicter.movie;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.DateUtil;
import com.tenco.indiepicter._core.utils.PicToStringUtil;
import com.tenco.indiepicter._core.utils.StringUtil;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter._core.vo.MyPath;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Time;
import java.time.Year;
import java.util.UUID;

@Slf4j
@Service
public class MovieService {

    @Autowired
    MovieRepository movieRepository;

    @Transactional
    public int saveMovie(FundingSaveDTO fundingSaveDTO){
        Movie movie = Movie.builder()
                .makeYear(fundingSaveDTO.getMakeYear())
                .production(fundingSaveDTO.getProduction())
                .movieName(fundingSaveDTO.getMovieTitle())
                .synopsis(fundingSaveDTO.getSynopsis())
                .thumbnail(PicToStringUtil.picToString(fundingSaveDTO.getMovieThumbnail()))
                .directingIntension(fundingSaveDTO.getDirectingIntension())
                .genre(fundingSaveDTO.getGenre())
                .runningGrade(fundingSaveDTO.getRunningGrade())
                .director(fundingSaveDTO.getStaff().getDirector())
                .directorPic(PicToStringUtil.picToString(fundingSaveDTO.getDirectorPhoto()))
                .actor(StringUtil.stringJoin(StringUtil.listToString(fundingSaveDTO.getActors()), StringUtil.listToString(fundingSaveDTO.getActorRoles())))
                .directorCareers(StringUtil.stringBrJoin(StringUtil.listToString(fundingSaveDTO.getDirectorCareers()), StringUtil.listToString(fundingSaveDTO.getDirectorCareerYears())))
                .directorAwardsFilm(StringUtil.stringBrJoin(StringUtil.listToString(fundingSaveDTO.getDirectorAwards()), StringUtil.listToString(fundingSaveDTO.getDirectorAwardYears())))
                .dDay(DateUtil.stringToDate(fundingSaveDTO.getDDay()))
                .build();

        int resultRowCount = movieRepository.saveMovie(movie);
        Integer movieKey = movie.getId();
        if(resultRowCount != 1) {
            throw new MyDynamicException("영화 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return movieKey;
    }

}


