package com.tenco.indiepicter._core.handler;

import com.tenco.indiepicter._core.handler.exception.MyDynamicException;
import com.tenco.indiepicter._core.handler.exception.MyUnAuthorizedException;
import com.tenco.indiepicter._core.handler.exception.MyValidationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Slf4j
@RestControllerAdvice
public class MyDynamiclExceptionHandler {

    // 아래 나열한 exception에 해당하지 않을 경우 최후에 실행되는 핸들러, 기본동작: 뒤로가기
    @ExceptionHandler(Exception.class)
    public String exception(Exception e) {
        log.info("기타 Exception 발생");
        log.info("=======예외 내용 ===========");
        log.info(e.getMessage());
        log.info("=======예외 발생 클래스=======");
        log.info(e.getClass().getName());
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert('"+ e.getMessage() +"');");
        sb.append("history.back();");
        sb.append("</script>");
        return sb.toString();
    }

    // 기본 exception 핸들러,  기본동작 : 뒤로가기
    @ExceptionHandler(MyDynamicException.class)
    public String myDynamicException(MyDynamicException e) {
        log.info("MyDanamicException 발생");
        log.info("=======예외 내용 ===========");
        log.info(e.getMessage());
        log.info("=======예외 발생 클래스=======");
        log.info(e.getClass().getName());
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert('"+ e.getMessage() +"');");
        sb.append("history.back();");
        sb.append("</script>");
        return sb.toString();
    }

    //허가되지 않은 접근시에 원하는 위치로 이동시킴, 기본동작 : 특정페이지로 이동
    @ExceptionHandler(MyUnAuthorizedException.class)
    public String unAuthorizedException(MyUnAuthorizedException e) {
        log.info("MyUnAuthorizedException 발생");
        log.info("=======예외 내용 ===========");
        log.info(e.getMessage());
        log.info("=======예외 발생 클래스=======");
        log.info(e.getClass().getName());
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert('"+ e.getMessage() +"');");
        sb.append("location.href='/user/login';");
        sb.append("</script>");
        return sb.toString();
    }
    //validation 체크 실패시 동작, 기본동작: 뒤로가기
    @ExceptionHandler
    public String validationException(MyValidationException e){
        log.info("MyValidationException 발생");
        log.info("=======Validation 예외가 발생한 필드 ==========");
        log.info(e.getErroMap().toString());
        Iterator<String> iterator = e.getErroMap().values().iterator();
        String firstValue = iterator.hasNext() ? iterator.next() : "";
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert('"+ firstValue+"');");
        sb.append("location.href='/user/sign-in';");
        sb.append("</script>");
        return sb.toString();
    }
}
