package com.silver.hallofart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	@GetMapping({"/test2", "2"})
	public String hello2() {
		return "layout/header";
	}
	

}
