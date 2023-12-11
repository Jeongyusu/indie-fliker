package com.tenco.indiepicter.theater;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Theater {
    private Integer id;
    private String theaterName;
    private String tel;
    private String address;
    private String park;
    private Integer totalSeat;

    @Builder
    public Theater(Integer id, String theaterName, String tel, String address, String park, Integer totalSeat) {
        this.id = id;
        this.theaterName = theaterName;
        this.tel = tel;
        this.address = address;
        this.park = park;
        this.totalSeat = totalSeat;
    }
}
