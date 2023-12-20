package com.tenco.indiepicter.invitation;

import com.tenco.indiepicter.reservation.response.VipReservationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvitationService {

    @Autowired
    private InvitationRepository invitationRepository;

    public List<Invitation> myInvitationLists(Integer principal){

        return this.invitationRepository.findById(principal);

    }




}
