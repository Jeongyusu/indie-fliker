package com.tenco.indiepicter.seat;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Seat {

	private Integer id;
	private String seats;
	private Integer runningScheduleId;
	private Integer userId;

	@Builder
	public Seat(Integer id, String seats, Integer runningScheduleId, Integer userId) {
		this.id = id;
		this.seats = seats;
		this.runningScheduleId = runningScheduleId;
		this.userId = userId;
	}
}
