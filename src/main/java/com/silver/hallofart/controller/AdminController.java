package com.silver.hallofart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/main")
	public String main() {
		return "admin/main";
	}
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	@GetMapping("/register")
	public String register() {
		return "admin/register";
	}
	@GetMapping("/password")
	public String password() {
		return "admin/password";
	}
	@GetMapping("/layout-static")
	public String layoutstatic() {
		return "admin/layout-static";
	}
	@GetMapping("/layout-sidenav-light")
	public String layout_sidenav() {
		return "admin/layout-sidenav-light";
	}
	@GetMapping("/tables")
	public String tables() {
		return "admin/tables";
	}
	@GetMapping("/charts")
	public String charts() {
		return "admin/charts";
	}
<<<<<<< HEAD
	@GetMapping("/insertShow")
	public String insertShow() {
		return "admin/insertShow";
	}
=======
>>>>>>> eadd2e2d323580e4cc646bd6e11aaeff64027280
}
