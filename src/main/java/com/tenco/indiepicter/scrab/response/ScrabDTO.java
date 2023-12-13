package com.tenco.indiepicter.scrab;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class ScrabDTO {

    @Data
    @NoArgsConstructor
    public static class ToggleRequestDTO{
        private Integer userId;
        private Integer fundingId;
    }
    @Getter
    @AllArgsConstructor
    public static class ToggleResponseDTO{
        private boolean scrabbed;
    }
}
