package com.tenco.indiepicter.invitation;

import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
public class Invitation {
    private Integer id;
    private String invitationCode;
    private String movieName;
    private String theaterName;
    private String theaterAddress;
    private Timestamp movieTime;
    private Timestamp createdAt;
    private Integer userId;

    @Builder
    public Invitation(Integer id, String invitationCode, String movieName, String theaterName, String theaterAddress, Timestamp movieTime, Timestamp createdAt, Integer userId) {
        this.id = id;
        this.invitationCode = invitationCode;
        this.movieName = movieName;
        this.theaterName = theaterName;
        this.theaterAddress = theaterAddress;
        this.movieTime = movieTime;
        this.createdAt = createdAt;
        this.userId = userId;
    }
}
