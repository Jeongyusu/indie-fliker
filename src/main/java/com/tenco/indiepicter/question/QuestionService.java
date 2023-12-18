package com.tenco.indiepicter.question;

import com.tenco.indiepicter.notice.Notice;
import com.tenco.indiepicter.notice.response.NoticePagingResponseDTO;
import com.tenco.indiepicter.question.response.QuestionPagingResponseDTO;
import com.tenco.indiepicter.question.response.QuestionResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    // 페이징을 위한 클래스 변수 선언
    int pageLimit = 5; // 한 페이지당 보여줄 글 갯수
    int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수


// -------------------------------------------------------------------------------------------------------------

    // 카테고리(회원정보) 페이징 조회
    public List<QuestionResponseDTO> questionUserPaging(Integer page){

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        // 일단 저는 이렇게 이해했습니다!! 정확하지 않음 ㅠㅜ
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.questionRepository.findByQuestionUserPagingLists(pagingParams);
    }

    // 페이징 계산
    public QuestionPagingResponseDTO userPagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.questionRepository.pageUserCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int)(Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int)(Math.ceil((double) page/ blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        QuestionPagingResponseDTO pagingDto = new QuestionPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

// -------------------------------------------------------------------------------------------------------------

    // 카테고리(결제) 페이징 조회
    public List<QuestionResponseDTO> questionPayPaging(Integer page){

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        // 일단 저는 이렇게 이해했습니다!! 정확하지 않음 ㅠㅜ
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.questionRepository.findByQuestionPayPagingLists(pagingParams);
    }

    // 페이징 계산
    public QuestionPagingResponseDTO payPagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.questionRepository.pagePayCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int)(Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int)(Math.ceil((double) page/ blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        QuestionPagingResponseDTO pagingDto = new QuestionPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

// -------------------------------------------------------------------------------------------------------------

    // 카테고리(취소/환불) 페이징 조회
    public List<QuestionResponseDTO> questionCancelPaging(Integer page){

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        // 일단 저는 이렇게 이해했습니다!! 정확하지 않음 ㅠㅜ
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.questionRepository.findByQuestionCancelPagingLists(pagingParams);
    }

    // 페이징 계산
    public QuestionPagingResponseDTO cancelPagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.questionRepository.pageCancelCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int)(Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int)(Math.ceil((double) page/ blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        QuestionPagingResponseDTO pagingDto = new QuestionPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

// -------------------------------------------------------------------------------------------------------------

    // 카테고리(영화예매) 페이징 조회
    public List<QuestionResponseDTO> questionReservationPaging(Integer page){

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        // 일단 저는 이렇게 이해했습니다!! 정확하지 않음 ㅠㅜ
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.questionRepository.findByQuestionReservationPagingLists(pagingParams);
    }

    // 페이징 계산
    public QuestionPagingResponseDTO reservationPagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.questionRepository.pageReservationCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int)(Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int)(Math.ceil((double) page/ blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        QuestionPagingResponseDTO pagingDto = new QuestionPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

// -------------------------------------------------------------------------------------------------------------

    // 카테고리(VIP) 페이징 조회
    public List<QuestionResponseDTO> questionVipPaging(Integer page){

        // 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
        // 일단 저는 이렇게 이해했습니다!! 정확하지 않음 ㅠㅜ
        int pageStart = (page - 1) * pageLimit;

        // 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("pageStart", pageStart);
        pagingParams.put("pageLimit", pageLimit);

        return this.questionRepository.findByQuestionVipPagingLists(pagingParams);
    }

    // 페이징 계산
    public QuestionPagingResponseDTO vipPagingParam(Integer page) {
        // 전체 글 갯수 조회
        int pageCount = this.questionRepository.pageVipCount();
        // 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
        int maxPage = (int)(Math.ceil((double) pageCount / pageLimit));
        // 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
        int startPage = (((int)(Math.ceil((double) page/ blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
        int endPage = startPage + blockLimit - 1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        QuestionPagingResponseDTO pagingDto = new QuestionPagingResponseDTO();
        pagingDto.setPage(page);
        pagingDto.setMaxPage(maxPage);
        pagingDto.setStartPage(startPage);
        pagingDto.setEndPage(endPage);

        return pagingDto;
    }

// -------------------------------------------------------------------------------------------------------------

}
