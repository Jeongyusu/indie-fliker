package com.tenco.indiepicter.movie;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.DateUtil;
import com.tenco.indiepicter._core.utils.PicToStringUtil;
import com.tenco.indiepicter._core.utils.StringUtil;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.movie.response.OnlineStreamingDateSettingDTO;
import com.tenco.indiepicter.review.normalreview.NormalReviewRepository;
import com.tenco.indiepicter.review.normalreview.NormalReviewService;
import com.tenco.indiepicter.review.vipreview.VipReviewRepository;
import lombok.extern.slf4j.Slf4j;
import com.tenco.indiepicter.movie.moviephoto.MoviePhoto;
import com.tenco.indiepicter.movie.moviephoto.MoviePhotoRepository;
import com.tenco.indiepicter.movie.response.OnMovieDetailDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Slf4j
@Service
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private MoviePhotoRepository moviePhotoRepository;

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

    // 온라인 상영 영화 정보 및 무비 파일 조회
    public OnMovieDetailDTO onTheaterToMovie(Integer movieId) {
        List<MoviePhoto> moviePhotos = moviePhotoRepository.findByMovieId(movieId);
        OnMovieDetailDTO responseDTO = movieRepository.findByMovieIdToMovie(movieId);
        responseDTO.setMoviePics(moviePhotos);

        return responseDTO;
    }

    // 어드민 페이지 무비 테이블 온라인 상영기간 조회
    public OnlineStreamingDateSettingDTO findById(Integer id){
        return movieRepository.findById(id);
    }
}


