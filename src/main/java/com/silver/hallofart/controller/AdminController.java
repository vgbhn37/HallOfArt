package com.silver.hallofart.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.silver.hallofart.dto.AdminDto;
import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.Show;
import com.silver.hallofart.service.AdminService;
import com.silver.hallofart.service.CustomerServiceService;
import com.silver.hallofart.service.ShowService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	public AdminService service;
	
	@Autowired
	public ShowService showService;
	
	@Autowired
	public CustomerServiceService customerService;
	
	@GetMapping({"/main","/"})
	public String main(@ModelAttribute("paging") PagingDto paging , 
							  @RequestParam(value="page", required = false, defaultValue="1")int page, 
							  Model model) {
		
		AdminDto count = service.findCountAll();
		model.addAttribute("count", count);
		
		List<Show> list = service.findAll(paging);
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
	public String showList(@ModelAttribute("paging") PagingDto paging , 
									@RequestParam(value="page", required = false, defaultValue="1")int page, 
									Model model) {
		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(service.countShow(pagination));
		
		model.addAttribute("pagination", pagination);
		List<Show> list = service.findAll(paging);
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
	public String bookList(@ModelAttribute("paging") PagingDto paging , 
									@RequestParam(value="page", required = false, defaultValue="1")int page, 
									Model model) {
		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(service.countBooking(pagination));
		
		model.addAttribute("pagination", pagination);
		List<AdminDto> list = service.findBookingAll(paging);
		System.out.println("booklist list : "+list);
		model.addAttribute("list", list);
		return "admin/bookList";
	}

	@GetMapping("/merchantList")
	public String merchantList(@ModelAttribute("paging") PagingDto paging , 
										  @RequestParam(value="page", required = false, defaultValue="1")int page, 
										  Model model) {
		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(service.countPayment(pagination));
		
		model.addAttribute("pagination", pagination);
		List<PaymentDto> list = service.findMerchantAll(paging);
		model.addAttribute("list", list);
		return "admin/merchantList";
	}
}
