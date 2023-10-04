package com.silver.hallofart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.silver.hallofart.dto.PagingDto;
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
	public String announcement(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page", 
		    required = false, defaultValue="1")int page, Model model) {
		paging.setPage(page);
		List<Announcement> announcementList = customerServiceService.selectAllAnnouncement(paging);
		int count = (customerServiceService.countPage(paging)) / 10 + 1;
		model.addAttribute("count", count);
		model.addAttribute("announcementList", announcementList);
		return "customerservice/announcement";
	}
	
	@GetMapping("/announcement/write")
	public String announcementWrite() {
		return "customerservice/announcementWrite";
	}
	
	@PostMapping("/announcement/write")
	public String announcementWriteProc(Announcement announcement) {
		customerServiceService.insertAnnouncement(announcement);
		return "redirect:/customerservice/announcement";
	}
	
	@GetMapping("/announcement/detail")
	public String announcementDetail(@ModelAttribute("page") int page, @RequestParam("id") Integer id, Model model) {
		model.addAttribute("announcement", customerServiceService.findAnnouncementById(id));
		return "customerservice/announcementDetail";
	}
	
	@GetMapping("/announcement/modify")
	public String announcementModify(@RequestParam("id") Integer id, @RequestParam("page") int page, Model model) {
		model.addAttribute("announcement", customerServiceService.findAnnouncementById(id));
		model.addAttribute("page", page);
		return "customerservice/announcementModify";
	}
	
	@PostMapping("/announcement/modify")
	public String announcementModifyProc(Announcement announcement, int page) {
		customerServiceService.updateAnnouncement(announcement);
		return "redirect:/customerservice/announcement/detail?page=" + page + "&id=" + announcement.getId();
	}
	
	@GetMapping("/announcement/delete")
	public String announcementDelete(@RequestParam("id")Integer id) {
		customerServiceService.deleteAnnouncement(id);
		return "redirect:/customerservice/announcement";
	}
	
	@GetMapping("/information")
	public String information() {
		return "customerservice/information";
	}
	
}
