package com.tenco.indiepicter.theater;

import lombok.Data;

public class TheaterRequest {

    @Data
    public static class FindByTheaterDTO{
        private Integer theaterId;
    }
}
