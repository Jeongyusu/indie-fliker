package com.tenco.indiepicter._core.handler.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class MyApiException extends RuntimeException{
    private HttpStatus status;

    public MyApiException(String message, HttpStatus status) {
        super(message);
        this.status = status;
    }
}
