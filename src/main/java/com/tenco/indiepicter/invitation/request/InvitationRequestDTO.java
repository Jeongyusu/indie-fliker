package com.tenco.indiepicter.invitation.request;

import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;

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
}
