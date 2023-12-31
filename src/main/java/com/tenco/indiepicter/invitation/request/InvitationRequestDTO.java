package com.tenco.indiepicter.invitation.request;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.tenco.indiepicter.user.User;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class InvitationRequestDTO {
    private String invitationCode;
    private String movieName;
    private String theaterName;
    private String theaterAddress;
    private String movieTime;
    private Timestamp createdAt;
    private Integer userId;
    
//    @Builder
//    @JsonCreator
//    public InvitationRequestDTO(String invitationCode, String movieName, String theaterName, String theaterAddress, String movieTime, Timestamp createdAt, Integer userId) {
//        this.invitationCode = invitationCode;
//        this.movieName = movieName;
//        this.theaterName = theaterName;
//        this.theaterAddress = theaterAddress;
//        this.movieTime = movieTime;
//        this.createdAt = createdAt;
//        this.userId = userId;
//
//    }
}
