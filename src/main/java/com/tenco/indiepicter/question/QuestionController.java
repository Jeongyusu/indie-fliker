package com.tenco.indiepicter.question;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuestionController {


    private QuestionService questionService;

    @GetMapping("/question")
    public String question(Model model){



        return "mypage/question";
    }

}
