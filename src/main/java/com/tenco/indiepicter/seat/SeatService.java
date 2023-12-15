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
        List<ExistSeatDTO> responseDTOs = seatRepository.findByRunningDateId(runningDateId);
        return responseDTOs;
    }

    // 예약 완료된 좌석 등록(좌석 갯수만큼 insert 진행)
    @Transactional
    public int saveSeat(LastOrderDTO lastOrderDTO, Integer principalId) {
        String saveSeats = lastOrderDTO.getSeatNames();
        List<String> splitSaveSeats = List.of(saveSeats.split(","));
        List<Seat> seats = new ArrayList<>();
        for (int i = 0; i < splitSaveSeats.size(); i++){
            Seat seat = Seat.builder()
                    .seats(splitSaveSeats.get(i))
                    .runningScheduleId(lastOrderDTO.getRunningDateId())
                    .userId(principalId)
                    .build();
            seats.add(seat);
        }

        int rowResultCount = 0;
        for (Seat seat : seats) {
            int result = seatRepository.insert(seat);
            rowResultCount += result;
        }

        return rowResultCount;
    }
}
