package com.tenco.indiepicter.invitation;

import com.tenco.indiepicter.invitation.response.InvitationPagingResponseDTO;
import com.tenco.indiepicter.notice.response.NoticePagingResponseDTO;
import com.tenco.indiepicter.reservation.response.VipReservationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InvitationService {

    @Autowired
    private InvitationRepository invitationRepository;

    public List<Invitation> myInvitationLists(Integer principal){
        return this.invitationRepository.findById(principal);
    }

// ---------------------------------------------------------------------------------
    
    // 나의 초청권 현황 페이징 조회
    
    // 페이징을 위한 클래스 변수 선언
    int pageLimit = 3; // 한 페이지당 보여줄 초청권 갯수
    int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수
    public List<Invitation> myInvitationPagingLists(Integer page, Integer principalId){

        // 인덱스 번호 0부터 시작이기 때문에 -1로 처리 해준다.
        int pageStart = (page - 1) * pageLimit;
            
        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        List<Invitation> pagingLists = this.invitationRepository.findByInvitationPagingLists(pagingParams, principalId);

        return pagingLists;
    }

    // 페이징 계산
    public InvitationPagingResponseDTO pagingParam(Integer page, Integer principalId) {
        // 전체 글 갯수 조회
        int pageCount = this.invitationRepository.pageCount(principalId);
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int)(Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int)(Math.ceil((double) page/ blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        InvitationPagingResponseDTO pagingDto = new InvitationPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

// ---------------------------------------------------------------------------------

}
