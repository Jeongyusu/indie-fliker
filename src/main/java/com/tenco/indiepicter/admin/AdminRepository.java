package com.tenco.indiepicter.admin;

import com.tenco.indiepicter.invitation.Invitation;
import com.tenco.indiepicter.invitation.response.InvitationResponseDTO;
import com.tenco.indiepicter.notice.Notice;
import com.tenco.indiepicter.user.User;
import org.apache.ibatis.annotations.Mapper;

import javax.xml.stream.events.Comment;
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
    public int insert(Invitation invitation);

    // 회원 등급 수정 (VIP로 수정)
    public void updateVip(Integer id);

    // 회원 등급 수정 (NORML로 수정)
    public void updateNormal(Integer id);

    // 댓글삭제
    public void deleteComment(Integer id);

    // 댓글 불러오기
    List<Comment> getCommentsByUserId(int userId);


}
