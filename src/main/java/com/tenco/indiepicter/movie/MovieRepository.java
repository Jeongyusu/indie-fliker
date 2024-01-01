package com.tenco.indiepicter.movie;

import com.tenco.indiepicter.funding.request.AdminRequestFundingUpdateFormDTO;
import com.tenco.indiepicter.funding.response.AdminFundingUpdateFormDTO;
import com.tenco.indiepicter.movie.request.OfflineOpenDateSettingDTO;
import com.tenco.indiepicter.movie.request.OnlineOpenDateSettingDTO;
import com.tenco.indiepicter.movie.response.OfflineStreamingDateSettingDTO;
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

    // admin 오프라인 상영기간 설정 페이지 : movie 아이디로 movie 조회
    public OfflineStreamingDateSettingDTO findByIdOffline(Integer id);

    // 온라인 상영기간 및 채팅 기간 설정
    public int updateMovieOpenDate(OnlineOpenDateSettingDTO onlineOpenDateSettingDTO);

    // 오프라인 상영기간 설정
    public int updateOffMovieOpenDate(OfflineOpenDateSettingDTO offlineOpenDateSettingDTO);

    // 어드민 페이지 영화 수정
    public int updateById(Movie movie);

    // 어드민 페이지 펀딩 삭제
    public int deleteById(Integer id);

    //무비 아이디로 무비 객체 조회
    public Movie findByIdAboutMovie(Integer id);

}
