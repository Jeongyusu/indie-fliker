package com.tenco.indiepicter.seat;

import com.tenco.indiepicter.order.Order;
import com.tenco.indiepicter.order.request.SaveOrderDTO;
import com.tenco.indiepicter.seat.request.SaveSeatDTO;
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

    @Transactional
    // 예약 완료된 좌석 등록(좌석 갯수만큼 insert 진행)
    public int saveSeat(SaveSeatDTO saveSeatDTO, Integer principalId) {
        String saveSeats = saveSeatDTO.getSeatNames();
        List<String> splitSaveSeats = List.of(saveSeats.split(","));
        List<Seat> seats = new ArrayList<>();
        for (int i = 0; i < splitSaveSeats.size(); i++){
            Seat seat = Seat.builder()
                    .seatName(splitSaveSeats.get(i))
                    .runningScheduleId(saveSeatDTO.getRunningDateId())
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
