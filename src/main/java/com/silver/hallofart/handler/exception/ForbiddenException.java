package com.silver.hallofart.handler.exception;

import org.springframework.http.HttpStatus;

public class ForbiddenException extends RuntimeException {
	
	private HttpStatus status;

	public ForbiddenException(String message, HttpStatus status) {
		super(message);
		this.status = status;
	}
}
