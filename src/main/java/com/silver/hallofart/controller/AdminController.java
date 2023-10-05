package com.silver.hallofart.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.silver.hallofart.repository.model.Show;
import com.silver.hallofart.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	public AdminService service;
	
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
	
	@GetMapping("/showList")
	public String showList(Model model) {
		
		List<Show> list = service.findAll();
		model.addAttribute("list", list);
		return "admin/showList";
	}
	
	@GetMapping("/updateStatus")
	public String updateStatus(@Param("id") int id, @Param("showStatus") String showStatus) {
		service.updateStatus(id, showStatus);
		return "redirect:showList";
	}

}
