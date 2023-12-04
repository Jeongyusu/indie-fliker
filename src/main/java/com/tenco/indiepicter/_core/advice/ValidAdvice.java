package com.tenco.indiepicter._core.advice;

import com.tenco.indiepicter._core.handler.exception.MyPageException;
import com.tenco.indiepicter._core.handler.exception.MyValidationException;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Aspect
@Component
public class ValidAdvice {

    // 별칭 등록
    @Pointcut("@annotation(org.springframework.web.bind.annotation.PostMapping)")
    public void postMapping() {
    }
    @Pointcut("@annotation(org.springframework.web.bind.annotation.PutMapping)")
    public void putMapping() {
    }


    // 공통 기능
    @Before("postMapping() || putMapping()")
    public void checkValid(JoinPoint jp) {
        Object[] args = jp.getArgs();
        for (Object arg : args) {
            if (arg instanceof Errors) {
                Errors errors = (Errors) arg;

                if (errors.hasErrors()) {
                    List<FieldError> fieldErrors = errors.getFieldErrors();
                    Map<String, String> myErrors = new HashMap<>();
                    fieldErrors.forEach(e -> myErrors.put(e.getField(), e.getDefaultMessage()));
                    throw new MyValidationException(myErrors);
                }
            }
        }
    }
}