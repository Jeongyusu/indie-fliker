package com.tenco.indiepicter.seat;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Seat {

	private Integer id;
	private String seatName;
	private Integer runningScheduleId;
	
	@Builder
	public Seat(Integer id, String seatName, Integer runningScheduleId) {
		
		this.id = id;
		this.seatName = seatName;
		this.runningScheduleId = runningScheduleId;
	}
	

}
