package com.tenco.indiepicter.funding;

import com.tenco.indiepicter.banner.BannerRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class FundingService {

    @Autowired
    private FundingRepository fundingRepository;

    public List<FundingResponse.FundingPlusDTO.MoviesByGenreDTO> MoviesByGenre (String genre, Integer page, Integer pageSize){
        Integer offset = page * pageSize - pageSize;
        return fundingRepository.findAllByGenre(genre, pageSize, offset);
    }
}
