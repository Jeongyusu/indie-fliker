package com.tenco.indiepicter.funding;


import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FundingRepository {
    //펀딩 장르별 조회
    public List<Funding> findAllByGenre(String genre);

}
