package com.silver.hallofart.handler;

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.handler.exception.UnAuthorizedException;

@RestControllerAdvice
@Order(1)
public class MyUserExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public void exception(Exception e) {
		System.out.println("-----예외 발생-----");
		System.out.println(e.getMessage());
		System.out.println("-----------------");
	}
	
	@ExceptionHandler(CustomRestfulException.class)
	public String basicException(CustomRestfulException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert(' "+ e.getMessage() +" ');");
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
	
	// 로그인을 하지 않았을 경우 예외 처리
	@ExceptionHandler(UnAuthorizedException.class)
	public String notLoginException(UnAuthorizedException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert(' "+ e.getMessage() +" ');");
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
	
}
