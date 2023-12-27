package com.tenco.indiepicter.funding.fundingready;

import com.tenco.indiepicter.funding.Funding;
import com.tenco.indiepicter.funding.response.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FundingReadyRepository {

    public int saveFunding(FundingReady fundingReady);

    // 펀딩 준비 테이블 조회
    public List<FundingReadyDTO> findAllFundingReady(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset);

    //온라인 펀딩 상세보기
    public FundingReadyDetailDTO findByFundingIdAboutDetailfundingReady(Integer fundingReadyId);

    //id로 펀딩 준비 테이블 튜플 조회
    public FundingReady findById(Integer id);

    //id로 조회한 펀딩 준비테이블 튜플 삭제
    public void deleteById(Integer id);

    //펀딩 등록 승인 페이지 검색어 조회
    public List<SearchFundingReadyDTO> searchFundingReady(String keyword);

}
