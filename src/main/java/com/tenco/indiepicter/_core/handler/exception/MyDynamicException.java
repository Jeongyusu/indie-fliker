package com.tenco.indiepicter._core.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class MyDynamicException extends RuntimeException {
	
	private HttpStatus status;
	
	public MyDynamicException(String message, HttpStatus httpStatus) {
		super(message);
		this.status = httpStatus;
	}
}
