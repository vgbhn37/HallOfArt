package com.silver.hallofart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main")
	public String hello() {
		return "main";
	}
}
