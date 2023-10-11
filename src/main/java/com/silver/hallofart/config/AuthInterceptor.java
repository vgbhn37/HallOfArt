package com.silver.hallofart.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.handler.exception.UnAuthorizedException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthInterceptor implements HandlerInterceptor {
	
	// 컨트롤러 들어가기전에 호출되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("프리핸들러 호출");
		HttpSession session = request.getSession();
		UserDto principal = (UserDto) session.getAttribute("user");
		if(principal == null ) {
			throw new UnAuthorizedException("로그인 먼저 해주십시오", HttpStatus.UNAUTHORIZED);
		}
		
		return true;
	}
	
	@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
		}	
	
	@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
				throws Exception {
			HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
		}
}
