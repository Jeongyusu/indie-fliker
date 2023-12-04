package com.tenco.indiepicter._core.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class MyUnAuthorizedException extends RuntimeException {
	
	private HttpStatus status;
	
	public MyUnAuthorizedException(String message, HttpStatus status) {
		super(message);
		this.status = status;
	}
}
