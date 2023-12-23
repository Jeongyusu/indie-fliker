package com.tenco.indiepicter.movie;

import com.tenco.indiepicter.movie.request.OnlineOpenDateSettingDTO;
import com.tenco.indiepicter.movie.response.OnMovieDetailDTO;
import com.tenco.indiepicter.movie.response.OnlineStreamingDateSettingDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieRepository {

    //펀딩 아이디로 해당 영화 조회
    public Movie getMovieByFundingId(Integer fundingId);

    //무비 등록
    public int saveMovie(Movie movie);

    // 온라인 상영 영화 정보 및 무비 파일 조회
    public OnMovieDetailDTO findByMovieIdToMovie(Integer movieId);

    // admin 온라인 상영기간 설정 페이지 : movie 아이디로 movie 조회
    public OnlineStreamingDateSettingDTO findById(Integer id);

    public int updateMovieOpenDate(OnlineOpenDateSettingDTO onlineOpenDateSettingDTO);
}
