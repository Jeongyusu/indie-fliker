package com.tenco.indiepicter.seat;

import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class SeatService {

    @Autowired
    private SeatRepository seatRepository;

    public List<ExistSeatDTO> existSeat(Integer runnindDateId) {
        List<ExistSeatDTO> existSeatDTOs = seatRepository.findByRunningDateId(runnindDateId);
        return existSeatDTOs;
    }
}
