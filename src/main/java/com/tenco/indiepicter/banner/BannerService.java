package com.tenco.indiepicter.banner;

import com.tenco.indiepicter.funding.FundingResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class BannerService {

    @Autowired
    private BannerRepository bannerRepository;

    public List<FundingResponse.FundingPlusDTO.BannerDTO> DisplayBanner(String genre){
        return bannerRepository.findByGenre(genre)
                .stream()
                .map(FundingResponse.FundingPlusDTO.BannerDTO::new)
                .collect(Collectors.toList());
    }
}
