package com.tenco.indiepicter.movie;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.DateUtil;
import com.tenco.indiepicter._core.utils.PicToStringUtil;
import com.tenco.indiepicter._core.utils.StringUtil;
import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.request.FundingSaveDTO;
import com.tenco.indiepicter.funding.response.AdminFundingUpdateFormDTO;
import com.tenco.indiepicter.movie.request.OfflineOpenDateSettingDTO;
import com.tenco.indiepicter.movie.request.OnlineOpenDateSettingDTO;
import com.tenco.indiepicter.movie.response.OfflineStreamingDateSettingDTO;
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

    public OfflineStreamingDateSettingDTO findByIdOffline(Integer id){
        return movieRepository.findByIdOffline(id);
    }

    @Transactional
    public int updateMovieOpenDate(OnlineOpenDateSettingDTO onlineOpenDateSettingDTO){

        int resultRowCount = movieRepository.updateMovieOpenDate(onlineOpenDateSettingDTO);
        if(resultRowCount != 1) {
            throw new MyDynamicException("오픈 시간 설정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

    @Transactional
    public int updateOffMovieOpenDate(OfflineOpenDateSettingDTO offlineOpenDateSettingDTO){

        int resultRowCount = movieRepository.updateOffMovieOpenDate(offlineOpenDateSettingDTO);
        if(resultRowCount != 1) {
            throw new MyDynamicException("오프라인 상영 기간 설정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

    @Transactional
    public int updateById(AdminRequestFundingUpdateFormDTO adminRequestFundingUpdateFormDTO) {
       Movie movie = Movie.builder()
               .makeYear(adminRequestFundingUpdateFormDTO.getMakeYear())
               .production(adminRequestFundingUpdateFormDTO.getProduction())
               .movieName(adminRequestFundingUpdateFormDTO.getMovieTitle())
               .synopsis(adminRequestFundingUpdateFormDTO.getSynopsis())
               .thumbnail(PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getMovieThumbnail()))
               .directingIntension(adminRequestFundingUpdateFormDTO.getDirectingIntension())
               .genre(adminRequestFundingUpdateFormDTO.getGenre())
               .runningGrade(adminRequestFundingUpdateFormDTO.getRunningGrade())
               .director(adminRequestFundingUpdateFormDTO.getStaff().getDirector())
               .directorPic(PicToStringUtil.picToString(adminRequestFundingUpdateFormDTO.getDirectorPhoto()))
               .actor(StringUtil.stringJoin(StringUtil.listToString(adminRequestFundingUpdateFormDTO.getActors()), StringUtil.listToString(adminRequestFundingUpdateFormDTO.getActorRoles())))
               .directorCareers(StringUtil.stringBrJoin(StringUtil.listToString(adminRequestFundingUpdateFormDTO.getDirectorCareers()), StringUtil.listToString(adminRequestFundingUpdateFormDTO.getDirectorCareerYears())))
               .directorAwardsFilm(StringUtil.stringBrJoin(StringUtil.listToString(adminRequestFundingUpdateFormDTO.getDirectorAwards()), StringUtil.listToString(adminRequestFundingUpdateFormDTO.getDirectorAwardYears())))
               .dDay(DateUtil.stringToDate(adminRequestFundingUpdateFormDTO.getDDay()))
               .build();
        int resultRowCount = movieRepository.updateById(movie);
        if (resultRowCount != 1) {
            throw new MyDynamicException("영화 업데이트 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resultRowCount;
    }

}


