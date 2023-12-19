package com.tenco.indiepicter.admin;

import com.tenco.indiepicter.notice.Notice;
import com.tenco.indiepicter.user.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminRepository {

    // 일반 회원, VIP 회원 전체 페이징 조회
    public List<User> findByAllPagingLists(Map<String, Integer> pagingParams);

    // 일반 회원 관리 페이징 조회
    public List<User> findByAdminUserPagingLists(Map<String, Integer> pagingParams);

    // VIP 회원 관리 페이징 조회
    public List<User> findByAdminVipPagingLists(Map<String, Integer> pagingParams);

    // 일반 회원, VIP 회원 관리 전체 갯수 조회
    public Integer pageCount();

    // 일반 회원, VIP 회원 관리(회원 탈퇴)
    public void adminUserUpdate(Integer id);

    // VIP 초청권 발급
    public void insert(Integer id);

}
