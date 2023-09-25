package com.silver.hallofart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/show")
public class ShowController {

	@GetMapping("/main")
	public String main() {
		return "show/main";
	}
	
	@GetMapping("/detail")
	public String detail() {
		return "show/detail";
	}
}
