package com.tenco.indiepicter.invitation;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InvitationRepository {

    // 나의 초청권 현황 확인
    public List<Invitation> findById(Integer principal);

}
