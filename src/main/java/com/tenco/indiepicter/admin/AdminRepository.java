package com.tenco.indiepicter.admin;

import com.tenco.indiepicter.invitation.Invitation;
import com.tenco.indiepicter.user.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import javax.xml.stream.events.Comment;
import java.util.List;
import java.util.Map;

@Mapper
public interface AdminRepository {

    // 일반 회원, VIP 회원 전체 페이징 조회
    public List<User> findByAllPagingLists(Map<String, Integer> pagingParams);

    // 일반 회원, VIP 회원 전체 페이징 조회(탈퇴 회원 제외)

    public List<User> findByAllPagingListsExWithdrawal(Map<String, Integer> pagingParams);

    // 일반 회원 관리 페이징 조회
    public List<User> findByAdminUserPagingLists(Map<String, Integer> pagingParams);

    // VIP 회원 관리 페이징 조회
    public List<User> findByAdminVipPagingLists(Map<String, Integer> pagingParams);

    // 일반 회원, VIP 회원 관리 전체 갯수 조회
    public Integer pageCount();

    // 일반 회원만 전체 갯수 조회
    public Integer normalPageCount();
    
    // VIP 회원만 전체 갯수 조회
    public Integer vipPageCount();

    // 일반 회원, VIP 회원 관리(회원 탈퇴)
    public int adminUserUpdate(Integer id);

    // VIP 초청권 발급
    public int insert(Invitation invitation);

    // 회원 등급 수정 (VIP로 수정)
    public void updateVip(Integer id);

    // 회원 등급 수정 (NORML로 수정)
    public void updateNormal(Integer id);

    // 댓글삭제
//    public void deleteComment(Integer id);

    // 댓글 불러오기
    List<Comment> findByUserIdAndMovieId(int userId, int movieId);

    // 초청권관리 전체 페이징 검색어 조회
    public List<User> findByAllPagingListsAboutKeyword(@Param("pagingParams") Map<String, Integer> pagingParams, @Param("keyword") String keyword);

    // VIP 회원관리 전체 페이징 검색어 조회
    public List<User> findByAdminVipPagingKeywordLists(@Param("pagingParams") Map<String, Integer> pagingParams, @Param("keyword") String keyword);


    // 일반 회원관리 전체 페이징 검색어 조회
    public List<User> findByAdminNormalPagingKeywordLists(@Param("pagingParams") Map<String, Integer> pagingParams, @Param("keyword") String keyword);

    //전체 회원 키워드 검색어 결과 총 개수 조회
    public Integer keywordPageCount(String keyword);

    //일반회원 관리 키워드 검색어 결과 총 개수 조회
    public Integer keywordNormalPageCount(String keyword);

    //VIP회원 관리 키워드 검색어 결과 총 개수 조회
    public Integer keywordVipPageCount(String keyword);


}
