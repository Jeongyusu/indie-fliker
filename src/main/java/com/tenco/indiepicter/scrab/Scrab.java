package com.tenco.indiepicter.scrab;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Scrab {
    private Integer id;
    private Integer userId;
    private Integer fundingId;

    @Builder
    public Scrab(Integer id, Integer userId, Integer fundingId) {
        this.id = id;
        this.userId = userId;
        this.fundingId = fundingId;
    }
}
