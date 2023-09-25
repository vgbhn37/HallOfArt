package com.silver.hallofart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.service.CustomerServiceService;

@Controller
@RequestMapping("/customerservice")
public class CustomerServiceController {
	
	@Autowired
	private CustomerServiceService customerServiceService;
	//공지사항
	//주소설계 : http://localhost:80/customerservice/announcement
	@GetMapping("/announcement")
	public String announcement(Model model) {
		List<Announcement> announcementList = customerServiceService.selectAllAnnouncement();
		System.out.println(announcementList);
		model.addAttribute("announcementList", announcementList);
		return "customerservice/announcement";
	}
	
	
}
