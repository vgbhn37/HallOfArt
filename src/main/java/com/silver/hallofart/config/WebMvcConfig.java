package com.silver.hallofart.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private AuthInterceptor authInterceptor;
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor).addPathPatterns("/booking/**").addPathPatterns("/payment/**").addPathPatterns("/inquery/**").addPathPatterns("/user/my-info/**")
		.excludePathPatterns("/payment/cancel");
//		registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**");
	}
}
