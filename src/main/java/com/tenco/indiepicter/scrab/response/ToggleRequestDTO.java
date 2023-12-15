package com.tenco.indiepicter.scrab.response;


import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class ToggleRequestDTO {
        private Integer userId;
        private Integer fundingId;
}
