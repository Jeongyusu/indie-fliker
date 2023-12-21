package com.tenco.indiepicter.invitation;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface InvitationRepository {

    // 나의 초청권 현황 확인
    public List<Invitation> findById(Integer principal);

    // 나의 초청권 현황 페이징 조회
    public List<Invitation> findByInvitationPagingLists(Map<String, Integer> pagingParams);

    // 나의 초청권 전체 갯수 조회
    public Integer pageCount();

}
