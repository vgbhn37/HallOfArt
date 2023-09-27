package com.silver.hallofart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.silver.hallofart.dto.UserDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private HttpSession session;
	
	@GetMapping("/sign-up")
	public String signUp() {
		return "user/signUp";
	}
	
	@GetMapping("/sign-in")
	public String signIn() {
		return "user/signIn";
	}
	
	@PostMapping("/sign-up")
	public String signUpProcess(UserDto userDto) {
		if(userDto.getUsername() == null || userDto.getUsername().isEmpty()) {
			return null;
		}
		
		return null;
	}
	
}
