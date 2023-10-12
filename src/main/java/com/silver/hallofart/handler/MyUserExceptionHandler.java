package com.silver.hallofart.handler;

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.silver.hallofart.handler.exception.BadRequestException;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.handler.exception.ForbiddenException;
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
		sb.append("location.href='http://localhost/user/sign-in';");
		sb.append("</script>");
		return sb.toString();
	}
	
	// 권한이 없는 사용자가 접근일 시도 할 경우 예외 처리
	@ExceptionHandler(ForbiddenException.class)
	public String forbiddenException(ForbiddenException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert(' "+ e.getMessage() +" ');");
		sb.append("history.back();");
		sb.append("location.reload();");
		sb.append("</script>");
		return sb.toString();
	}
	
	//잘못된 요청, 혹은 유효하지 않은 요청을 받을 경우 예외 처리
	@ExceptionHandler(BadRequestException.class)
	public String badRequestException(BadRequestException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert(' "+ e.getMessage() +" ');");
		sb.append("history.back();");
		sb.append("location.reload();");
		sb.append("</script>");
		return sb.toString();
	}
	
}
