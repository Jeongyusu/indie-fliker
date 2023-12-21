package com.tenco.indiepicter.chat;

import com.tenco.indiepicter.chat.response.OpenMovieChatDTO;
import com.tenco.indiepicter.funding.response.FindByFundingIdDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatRepository {

    // 온라인 영화 개봉하는 영화 목록
    public OpenMovieChatDTO findByOpenMovie();
}
