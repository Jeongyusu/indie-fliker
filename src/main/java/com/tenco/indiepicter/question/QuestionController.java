package com.tenco.indiepicter.question;


import com.tenco.indiepicter.question.response.QuestionPagingResponseDTO;
import com.tenco.indiepicter.question.response.QuestionResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

//---------------------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(회워정보)
    @GetMapping("/user")
    public String questionUser(
            @RequestParam(value="page", required = false, defaultValue = "1") Integer page,
            Model model) {

        List<QuestionResponseDTO> questionUserPagingLists = this.questionService.questionUserPaging(page);
        QuestionPagingResponseDTO questionPagingResponseDTO = this.questionService.userPagingParam(page);
        model.addAttribute("questionUserPagingLists", questionUserPagingLists);
        model.addAttribute("paging", questionPagingResponseDTO);

        return "mypage/question/question_user";
    }
//---------------------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(결제)
    @GetMapping("/pay")
    public String questionPay(
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
            Model model) {

        List<QuestionResponseDTO> questionPayPagingLists = this.questionService.questionPayPaging(page);
        QuestionPagingResponseDTO questionPagingResponseDTO = this.questionService.payPagingParam(page);
        model.addAttribute("questionPayPagingLists", questionPayPagingLists);
        model.addAttribute("paging", questionPagingResponseDTO);

        return "mypage/question/question_pay";
    }
//---------------------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(취소/환불)
    @GetMapping("/cancel")
    public String questionCancel(
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
            Model model) {

        List<QuestionResponseDTO> questionCancelPagingLists = this.questionService.questionCancelPaging(page);
        QuestionPagingResponseDTO questionPagingResponseDTO = this.questionService.cancelPagingParam(page);
        model.addAttribute("questionCancelPagingLists", questionCancelPagingLists);
        model.addAttribute("paging", questionPagingResponseDTO);

        return "mypage/question/question_cancel";
    }
//---------------------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(영화예매)
    @GetMapping("/reservation")
    public String questionReservation(
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
            Model model) {

        List<QuestionResponseDTO> questionReservationPagingLists = this.questionService.questionReservationPaging(page);
        QuestionPagingResponseDTO questionPagingResponseDTO = this.questionService.reservationPagingParam(page);
        model.addAttribute("questionReservationPagingLists", questionReservationPagingLists);
        model.addAttribute("paging", questionPagingResponseDTO);

        return "mypage/question/question_reservation";
    }
//---------------------------------------------------------------------------------------------------------------
    // 자주 묻는 질문(VIP)
    @GetMapping("/VIP")
    public String questionVip(
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
            Model model) {

        List<QuestionResponseDTO> questionVipPagingLists = this.questionService.questionVipPaging(page);
        QuestionPagingResponseDTO questionPagingResponseDTO = this.questionService.vipPagingParam(page);
        model.addAttribute("questionVipPagingLists", questionVipPagingLists);
        model.addAttribute("paging", questionPagingResponseDTO);

        return "mypage/question/question_vip";
    }
//---------------------------------------------------------------------------------------------------------------

    // 12-18 5:18 자주 묻는 질문 작업 완료

}
