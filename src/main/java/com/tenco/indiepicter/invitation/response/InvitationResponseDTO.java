package com.tenco.indiepicter.invitation.response;

import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Builder
public class InvitationResponseDTO {

    private String invitationCode;
    private String movieName;
    private String theaterName;
    private String theaterAddress;
    private String movieTime;
    private Timestamp createdAt;
    private Integer userId;

}
