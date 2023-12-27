package com.tenco.indiepicter.banner;

import com.tenco.indiepicter.funding.response.BannerDTO;
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

    public List<BannerDTO> DisplayBanner(String genre){
        return bannerRepository.findByGenre(genre)
                .stream()
                .map(BannerDTO::new)
                .collect(Collectors.toList());
    }

    public List<BannerDTO> DisplayBannerByAll(){
        return bannerRepository.findByAll().stream().map(BannerDTO::new).collect(Collectors.toList());
    }
}
