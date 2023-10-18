package com.silver.hallofart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.silver.hallofart.dto.AdminDto;
import com.silver.hallofart.dto.ClassificationDto;
import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.dto.RentalInfoDto;
import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Inquiry;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.Show;
import com.silver.hallofart.service.AdminService;
import com.silver.hallofart.service.CustomerServiceService;
import com.silver.hallofart.service.ShowService;

@Controller
@RequestMapping("/admin")
@Transactional
public class AdminController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	public AdminService service;
	
	@Autowired
	public ShowService showService;
	
	@Autowired
	public CustomerServiceService customerServiceService;
	
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
									@RequestParam(value="search", required = false) String search,
									Model model) {
		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(service.countShow(pagination));
		
		model.addAttribute("pagination", pagination);
		List<Show> list = search==null ? service.findAll(paging) : service.findShowBySearch(paging, search);
		model.addAttribute("list", list);
		
		List<RentalInfoDto> rental = showService.findRentalAll();
		model.addAttribute("rental", rental);
		System.out.println("rental : "+rental);
		
		return "admin/showList";
	}
	
	@GetMapping("/updateStatus")
	public String updateStatus(@Param("id") int id, @Param("status") String status) {
		service.updateStatus(id, status);
		return "redirect:showList";
	}
	
	@GetMapping("/insertShow")
	public String insertShow(@RequestParam String name, Model model) {
		
		List<Hall> halls = showService.findHallAll();
		model.addAttribute("halls", halls);
		
		List<String> list = showService.findAllHallTime(name);
		model.addAttribute("rentalList", list);
		model.addAttribute("name", name);
		
		Hall hallInfo = showService.findHallByName(name);
		model.addAttribute("hallInfo", hallInfo);
		System.out.println("hallInfo : "+hallInfo);
		
		return "admin/insertShow";
	}
	@PostMapping("/insert")
	public String applying(Show show, Rental rental,  String startTime) {
		System.out.println("inserting show : "+show);
		System.out.println("inserting seat : "+rental);
		try {
			showService.insertShow(show);
			showService.insertShowTime(startTime, show.getEndDate());
			showService.insertRental(rental);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:main";
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

	@GetMapping("/rentalList")
	public String rentalList(@ModelAttribute("paging") PagingDto paging , 
			@RequestParam(value="page", required = false, defaultValue="1")int page, 
			Model model) {
		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(service.countRental(pagination));
		
		model.addAttribute("pagination", pagination);
		List<RentalInfoDto> list = service.findRentalPaging(paging);
		model.addAttribute("list", list);
		System.out.println("rental : "+list);
		return "admin/rentalList";
	}
	
	@GetMapping("/modal")
	public String loginModal(Model model) {
		
		List<Hall> halls = showService.findHallAll();
		model.addAttribute("halls", halls);
		System.out.println(halls);
		
	    return "layout/modal";
	}
	
	@GetMapping("/announcement")
	public String announcementAdmin(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page", 
		    required = false, defaultValue="1")int page, @RequestParam(value="classification", 
		    required = false, defaultValue="전체")String classification, Model model) {
		//페이지네이션에 필요한 값 전달
		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(customerServiceService.countPage(pagination));
		//공지사항 목록 전달
		List<Announcement> announcementList = customerServiceService.selectAllAnnouncement(paging);
		model.addAttribute("announcementList", announcementList);
		model.addAttribute("pagination", pagination);
		return "admin/announcementAdmin";

	}
	
	@GetMapping("/inquiry/main")
	public String inquiryAdmin(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page", 
		    required = false, defaultValue="1")int page, @RequestParam(value="classification", 
		    required = false, defaultValue="전체")String classification, Model model) {
		UserDto user = (UserDto)session.getAttribute("user");
		paging.setPage(page);
		paging.setUserId(user.getId());
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(customerServiceService.countAllInquiryPage(paging));
		model.addAttribute("pagination", pagination);
		model.addAttribute("inquiryList", customerServiceService.findAllInquiry(paging));
		return "admin/inquiryAdmin";
	}
	
	//문의 ajax활용
	@GetMapping("/inquiry/classification")
	@ResponseBody
	public ClassificationDto inquiryClassification(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page", 
		    required = false, defaultValue="1")int page, @RequestParam(value="classification", 
		    required = false, defaultValue="전체")String classification) {
		paging.setPage(page);
		paging.setClassification(classification);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		ClassificationDto classificationDto = new ClassificationDto();
		//분류가 전체일 떄
		if(classification.equals("전체")) {
			pagination.setArticleTotalCount(customerServiceService.countAllInquiryPage(paging));
			List<Inquiry> inquiryList = customerServiceService.findAllInquiry(paging);
			classificationDto.setInquiryList(inquiryList);
			classificationDto.setPagination(pagination);
			return classificationDto;
		} 
		//분류값이 있을 때
		else {
			pagination.setArticleTotalCount(customerServiceService.countNoAnswer(paging));
			paging.setClassification(classification);
			List<Inquiry> inquiryList = customerServiceService.findNoAnswer(paging);
			classificationDto.setInquiryList(inquiryList);
			classificationDto.setPagination(pagination);
			return classificationDto;
		}
	}
}
