package com.tenco.indiepicter.theater;

import com.tenco.indiepicter.theater.response.TheaterListDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class TheaterService {

    @Autowired
    private TheaterRepository theaterRepository;

    public List<TheaterListDTO> mainPageTheaters(){
        return theaterRepository.findAllByCustom();
    }
}
