package com.tenco.indiepicter._core.handler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class MyApiExceptionHandler {

    @ExceptionHandler(Exception.class)
    public String exception(Exception e) {
        log.info("기타 Exception 발생");
        log.info("=======예외 내용 ===========");
        log.info(e.getMessage());
        log.info("=======예외 발생 클래스=======");
        log.info(e.getClass().getName());
        StringBuffer sb = new StringBuffer();
        sb.append("에러가 발생했습니다.");
        sb.append("발생 이유 : " +  e.getMessage());
        return sb.toString();
    }
}
