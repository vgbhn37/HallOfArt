package com.silver.hallofart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	@GetMapping("/401")
	public String error401() {
		return "admin/401";
	}
	@GetMapping("/404")
	public String error404() {
		return "admin/404";
	}
	@GetMapping("/500")
	public String error500() {
		return "admin/500";
	}
}
