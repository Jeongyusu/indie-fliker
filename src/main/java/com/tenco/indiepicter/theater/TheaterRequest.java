package com.tenco.indiepicter.theater;

import lombok.Data;

public class TheaterRequest {

    @Data
    public static class FindByTheaterIdDTO{
        private Integer theaterId;
    }
}
