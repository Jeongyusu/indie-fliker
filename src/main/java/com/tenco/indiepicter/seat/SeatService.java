package com.tenco.indiepicter.seat;


import com.tenco.indiepicter.order.response.LastOrderDTO;
import com.tenco.indiepicter.seat.response.ExistSeatDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class SeatService {

    @Autowired
    private SeatRepository seatRepository;

    // 이미 예약이 완료된 좌석 리스트
    public List<ExistSeatDTO> existSeat(Integer runningDateId) {
        List<Seat> seats = seatRepository.findByRunningDateId(runningDateId);
        List<ExistSeatDTO> responseDTOs = new ArrayList<>();
        for(Seat seat : seats){
            String seatName = seat.getSeats();
            List<String> splitSeatNames = List.of(seatName.split(","));
            for(String splitSeatName : splitSeatNames){
                ExistSeatDTO existSeatDTO = ExistSeatDTO.builder()
                        .seatName(splitSeatName)
                        .build();
                responseDTOs.add(existSeatDTO);
            }
        }

        return responseDTOs;
    }

    // 예약 완료된 좌석 등록
    @Transactional
    public int saveSeat(LastOrderDTO lastOrderDTO, Integer principalId) {
        Seat seat = Seat.builder()
                .seats(lastOrderDTO.getSeatNames())
                .runningScheduleId(lastOrderDTO.getRunningDateId())
                .userId(principalId)
                .build();

        int result = seatRepository.insert(seat);

        return result;
    }
}
