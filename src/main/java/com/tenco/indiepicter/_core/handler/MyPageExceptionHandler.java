package com.tenco.indiepicter._core.handler;

import com.tenco.indiepicter._core.handler.exception.MyPageException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@ControllerAdvice
public class MyPageExceptionHandler {

    @ExceptionHandler(MyPageException.class)
    public ModelAndView handleRuntimeException(MyPageException e) {
        log.info("MyPageException 발생");
        log.info(e.getMessage());
        log.info("======예외가 발생한 클래스=======");
        log.info(e.getClass().getName());
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
        modelAndView.addObject("message", e.getMessage());
        return modelAndView;
    }

}
