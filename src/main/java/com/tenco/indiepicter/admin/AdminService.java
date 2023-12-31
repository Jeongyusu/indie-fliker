package com.tenco.indiepicter.admin;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.TimeStampUtil;
import com.tenco.indiepicter.admin.response.AdminPagingResponseDTO;
import com.tenco.indiepicter.invitation.Invitation;
import com.tenco.indiepicter.invitation.request.InvitationRequestDTO;
import com.tenco.indiepicter.invitation.response.InvitationResponseDTO;
import com.tenco.indiepicter.notice.Notice;
import com.tenco.indiepicter.notice.response.NoticePagingResponseDTO;
import com.tenco.indiepicter.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.stream.events.Comment;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    // 페이징을 위한 클래스 변수 선언
    int pageLimit = 5; // 한 페이지당 보여줄 글 갯수
    int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수

// ------------------------------------------------------------------------------------------

    // 전체 조회 페이징 계산
    public AdminPagingResponseDTO pagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.adminRepository.pageCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int) (Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }

        AdminPagingResponseDTO pagingDto = new AdminPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }
    
    // 일반 회원 조회 페이징 계산
    public AdminPagingResponseDTO normalPagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.adminRepository.normalPageCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int) (Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }

        AdminPagingResponseDTO pagingDto = new AdminPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

    // VIP 회원 조회 페이징 계산
    public AdminPagingResponseDTO vipPagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.adminRepository.vipPageCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int) (Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }

        AdminPagingResponseDTO pagingDto = new AdminPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

    // 전체 조회 검색어 페이징 계산
    public AdminPagingResponseDTO keywordPagingParam(Integer page, String keyword) {
        // 전체 글 갯수 조회
        int pageCount = this.adminRepository.keywordPageCount(keyword);
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int) (Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        AdminPagingResponseDTO pagingDto = new AdminPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);
        return pagingDto;
    }

    // 일반회원 조회 검색어 페이징 계산
    public AdminPagingResponseDTO keywordNormalPagingParams(Integer page, String keyword) {
        // 전체 글 갯수 조회
        int pageCount = this.adminRepository.keywordNormalPageCount(keyword);
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int) (Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        AdminPagingResponseDTO pagingDto = new AdminPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);
        return pagingDto;
    }

    // VIP 회원 조회 검색어 페이징 계산
    public AdminPagingResponseDTO keywordVIPPagingParams(Integer page, String keyword) {
        // 전체 글 갯수 조회
        int pageCount = this.adminRepository.keywordVipPageCount(keyword);
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int) (Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        AdminPagingResponseDTO pagingDto = new AdminPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);
        return pagingDto;
    }



// ------------------------------------------------------------------------------------------

    // VIP 초청권 관리 전체 페이징 조회

    public List<User> adminAllPagingLists(Integer page) {

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.adminRepository.findByAllPagingLists(pagingParams);
    }

// ------------------------------------------------------------------------------------------

    // 일반 회원, VIP 회원 전체 페이징 조회 (탈퇴 회원 제외)
    public List<User> findByAllPagingListsExWithdrawal(Integer page) {

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.adminRepository.findByAllPagingListsExWithdrawal(pagingParams);
    }

// ------------------------------------------------------------------------------------------

    // 일반 회원 관리 페이징 조회
    public List<User> adminUserPagingLists(Integer page) {

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.adminRepository.findByAdminUserPagingLists(pagingParams);
    }

// ------------------------------------------------------------------------------------------

    // VIP 회원 관리 페이징 조회
    public List<User> adminVipPagingLists(Integer page) {

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.adminRepository.findByAdminVipPagingLists(pagingParams);
    }

// ------------------------------------------------------------------------------------------

    // 일반 회원, VIP 회원 관리(회원 탈퇴)
    public int isWithdrawal(Integer id) {
        int resultCount = this.adminRepository.adminUserUpdate(id);
        return resultCount;
    }

// ------------------------------------------------------------------------------------------

    // VIP 초청권 발급
    @Transactional
    public int vipIssued(InvitationRequestDTO invitationRequestDto) {

        Invitation invitation = Invitation.builder()
                .invitationCode(invitationRequestDto.getInvitationCode())
                .movieName(invitationRequestDto.getMovieName())
                .theaterName(invitationRequestDto.getTheaterName())
                .theaterAddress(invitationRequestDto.getTheaterAddress())
                .movieTime(invitationRequestDto.getMovieTime())
                .userId(invitationRequestDto.getUserId())
                .build();

        int resultInvitationCount = this.adminRepository.insert(invitation);

        if (resultInvitationCount != 1) {
            throw new MyDynamicException("초청권 발급에 실패했습니다.", HttpStatus.BAD_REQUEST);
        }

        return resultInvitationCount;
    }
// ------------------------------------------------------------------------------------------

    // 회원 등급 수정 (VIP로 수정)
    public void updateVip(Integer id) {
        this.adminRepository.updateVip(id);
    }

    // 회원 등급 수정 (NORML로 수정)
    public void updateNormal(Integer id) {
        this.adminRepository.updateNormal(id);
    }

    // ------------------------------------------------------------------------------------------
    // 댓글 삭제
//    public void deleteComment(int commentIdToDelete) {
//        adminRepository.deleteComment(commentIdToDelete);
//    }


    // 댓글 불러오기
    public List<Comment> getCommentsByUserId(int userId, int movieId) {
        return adminRepository.findByUserIdAndMovieId(userId, movieId);
    }



    // 초청권 관리 검색어 페이징 조회
    public List<User> adminUserPagingKeywordLists(Integer page, String keyword) {

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.adminRepository.findByAllPagingListsAboutKeyword(pagingParams, keyword);
    }

    //VIP 회원 관리 검색어 페이징 조회
    public List<User> findByAdminVipPagingKeywordLists(Integer page, String keyword) {
        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.adminRepository.findByAdminVipPagingKeywordLists(pagingParams, keyword);
    }

    //일반 회원 관리 검색어 페이징 조회
    public List<User> findByAdminNormalPagingKeywordLists(Integer page, String keyword) {
        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.adminRepository.findByAdminNormalPagingKeywordLists(pagingParams, keyword);
    }



}
