package com.tenco.indiepicter.invitation;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.reservation.response.VipReservationDTO;
import com.tenco.indiepicter.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String myInvitation(Model model){

        User principal = (User)session.getAttribute(Define.PRINCIPAL);
//        if (principal == null){
//            throw  new MyDynamicException("로그인을 먼저 해주세요.", HttpStatus.BAD_REQUEST);
//        }
        List<Invitation> myInvitationLists = this.invitationService.myInvitationLists(principal.getId());
        model.addAttribute("myInvitationLists", myInvitationLists);

        return "mypage/my_invitation";
    }


}
