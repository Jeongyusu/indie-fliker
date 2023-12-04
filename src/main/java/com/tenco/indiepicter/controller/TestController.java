package com.tenco.indiepicter.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@Slf4j
@RestController
public class TestController {


    @PostMapping("/test")
    public void test1(@RequestBody @Valid JoinDTO joinDTO, Errors errors){
        log.debug("진입");
    }

}
