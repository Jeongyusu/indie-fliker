package com.tenco.indiepicter.question;

import com.tenco.indiepicter.notice.Notice;
import com.tenco.indiepicter.question.response.QuestionResponseDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface QuestionRepository {

    // 질문 등록
    public void insert();


//-----------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(회원정보) 전체 갯수 조회
    public Integer pageUserCount();

    // 자주 묻는 질문(회원정보) 페이징 조회
    public List<QuestionResponseDTO> findByQuestionUserPagingLists(Map<String, Integer> pagingParams);
//-----------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(결제) 전체 갯수 조회
    public Integer pagePayCount();

    // 자주 묻는 질문(결제) 페이징 조회
    public List<QuestionResponseDTO> findByQuestionPayPagingLists(Map<String, Integer> pagingParams);
//-----------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(결제) 전체 갯수 조회
    public Integer pageCancelCount();

    // 자주 묻는 질문(결제) 페이징 조회
    public List<QuestionResponseDTO> findByQuestionCancelPagingLists(Map<String, Integer> pagingParams);
//-----------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(영화예매) 전체 갯수 조회
    public Integer pageReservationCount();

    // 자주 묻는 질문(영화예매) 페이징 조회
    public List<QuestionResponseDTO> findByQuestionReservationPagingLists(Map<String, Integer> pagingParams);
//-----------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(VIP) 전체 갯수 조회
    public Integer pageVipCount();

    // 자주 묻는 질문(VIP) 페이징 조회
    public List<QuestionResponseDTO> findByQuestionVipPagingLists(Map<String, Integer> pagingParams);
//-----------------------------------------------------------------------------------------------------
    // 자주 묻는 질문 키워드 검색결과 조회
    public List<QuestionResponseDTO> findByQuestionSearchPagingLists(@Param("p") Map<String, Integer> pagingParams, @Param("keyword") String keyword);

}
