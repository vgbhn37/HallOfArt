package com.silver.hallofart.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.silver.hallofart.dto.AdminDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.Show;
import com.silver.hallofart.service.AdminService;
import com.silver.hallofart.service.ShowService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	public AdminService service;
	
	@Autowired
	public ShowService showService;
	
	@GetMapping({"/main","/"})
	public String main(Model model) {
		
		AdminDto count = service.findCountAll();
		model.addAttribute("count", count);
		
		List<Show> list = service.findAll();
		model.addAttribute("list", list);
		
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
	
	@GetMapping("/insertShow")
	public String insertShow(Model model) {
		List<Hall> halls = showService.findHallAll();
		model.addAttribute("halls", halls);
		return "admin/insertShow";
	}
	@Transactional
	@PostMapping("/insert")
	public String applying(Show show, Rental rental) {
		System.out.println("inserting show : "+show);
		System.out.println("inserting seat : "+rental);
		try {
			showService.insertShow(show);
			showService.insertRental(rental);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:insertShow";
	}

	@GetMapping("/bookList")
	public String bookList(Model model) {
		List<AdminDto> list = service.findBookingAll();
		model.addAttribute("list", list);
		return "admin/bookList";
	}

	@GetMapping("/merchantList")
	public String merchantList(Model model) {
		List<PaymentDto> list = service.findMerchantAll();
		model.addAttribute("list", list);
		return "admin/merchantList";
	}
}
