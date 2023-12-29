package com.tenco.indiepicter.invitation;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.invitation.response.InvitationPagingResponseDTO;
import com.tenco.indiepicter.reservation.response.VipReservationDTO;
import com.tenco.indiepicter.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/invitation")
public class InvitationController {

    @Autowired
    private InvitationService invitationService;

    @Autowired
    private HttpSession session;

    // 나의 초청권 현황 확인
    @GetMapping("/my-invitation")
    public String myInvitation(
            @RequestParam(value="page", required=false, defaultValue="1") Integer page,
            Model model){

        User principal = (User)session.getAttribute(Define.PRINCIPAL);
        if (principal == null){
            throw  new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
        }
        List<Invitation> myInvitationPagingLists = this.invitationService.myInvitationPagingLists(page, principal.getId());
        InvitationPagingResponseDTO invitationPagingResponseDTO = this.invitationService.pagingParam(page, principal.getId());
        model.addAttribute("myInvitationPagingLists", myInvitationPagingLists);
        model.addAttribute("paging", invitationPagingResponseDTO);

        return "mypage/my_invitation";
    }

}

// 12-21 18:53 학원 작업 끝