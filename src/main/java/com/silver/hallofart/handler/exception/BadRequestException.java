package com.silver.hallofart.handler.exception;

import org.springframework.http.HttpStatus;

public class BadRequestException extends RuntimeException {
	
	private HttpStatus status;
	
	public BadRequestException(String message, HttpStatus status) {

		super(message);
		this.status = status;
	}
}
