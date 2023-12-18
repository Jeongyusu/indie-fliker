package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.BannerRepository;
import com.tenco.indiepicter.funding.response.*;
import com.tenco.indiepicter.order.response.LastOrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class FundingService {

    @Autowired
    private FundingRepository fundingRepository;

    public List<MoviesByGenreDTO> moviesByGenre(String genre, Integer page, Integer pageSize) {
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByGenre(genre, pageSize, offset);
    }

    public List<OnAirMovieDTO> onAirMovies() {
        return fundingRepository.findAllByOnAir();
    }

    public List<OnAirMovieRankingDTO> onAirRankedMovies() {
        return fundingRepository.findAllByOnAirAndRanking();
    }

    public FundingDetailDTO detailFunding(Integer fundingId) {
        return fundingRepository.findByFundingIdAboutDetailfunding(fundingId);
    }

    public OfflineMovieDetailDTO detailOfflineMovie(Integer fundingId) {
        return fundingRepository.findByFundingIdAboutOfflineMovie(fundingId);
    }

    // 결제 후 펀딩 누적 금액 및 참여 인원 추가하기
    public int addFundingTarget(LastOrderDTO lastOrderDTO) {
        Funding funding = fundingRepository.findById(lastOrderDTO.getFundingId());

        int addPresentPrice = funding.getPresentPrice() + lastOrderDTO.getFinalPrice();
        int addPeopleCount = funding.getPeopleCount() + lastOrderDTO.getTotalCount();

        return fundingRepository.updateById(lastOrderDTO.getFundingId(),addPresentPrice, addPeopleCount);
    }

}