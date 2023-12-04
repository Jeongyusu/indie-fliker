package com.tenco.indiepicter._core.handler.exception;

import lombok.Getter;

import java.util.Map;

@Getter
public class MyValidationException extends RuntimeException {

    private Map<String, String> erroMap;

    public MyValidationException(Map<String, String> erroMap) {
        this.erroMap = erroMap;
    }
}