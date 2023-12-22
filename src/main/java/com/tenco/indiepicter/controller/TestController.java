package com.tenco.indiepicter.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Slf4j
@RestController
public class TestController {


    @PostMapping("/test")
    public void test1(@RequestBody @Valid JoinDTO joinDTO, Errors errors) {
        log.debug("진입");
    }

    @ResponseBody
    @GetMapping("/test1")
    public String test() {
        return "https://indieground.kr/fileFolder/12d5d861-72a7-4900-9d7f-ce59e8b45a75_jpg\t";
    }


}
