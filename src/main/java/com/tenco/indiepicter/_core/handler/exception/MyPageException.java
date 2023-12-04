package com.tenco.indiepicter._core.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class MyPageException extends RuntimeException{
	
	private HttpStatus httpStatus;
	
	public MyPageException(String message, HttpStatus status) {
		super(message);
		this.httpStatus = status;
	}
	
}
