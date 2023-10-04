package com.silver.hallofart.handler;

import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.silver.hallofart.handler.exception.CustomPageException;

@ControllerAdvice
@Order(2)
public class UserExceptionHandler {
	
	public void exception(Exception e) {
		System.out.println("===== 예외 발생 =====");
		System.out.println(e.getMessage());
		System.out.println("===================");
	}
	
	@ExceptionHandler(CustomPageException.class)
	public ModelAndView handleRuntimePageException(CustomPageException e) {
		ModelAndView modelAndView = new ModelAndView("errorPage");
		modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
		modelAndView.addObject("message", e.getMessage());
		return modelAndView;
	}
	
}
