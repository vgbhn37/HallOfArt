package com.silver.hallofart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Inquiry;
import com.silver.hallofart.repository.model.InquiryAnswer;
import com.silver.hallofart.service.CustomerServiceService;

@Controller
@RequestMapping("/customerservice")
public class CustomerServiceController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private CustomerServiceService customerServiceService;
	
	//공지사항
	//주소설계 : http://localhost:80/customerservice/announcement
	@GetMapping("/announcement")
	public String announcement(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page", 
		    required = false, defaultValue="1")int page, Model model) {
		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(customerServiceService.countPage(pagination));
		List<Announcement> announcementList = customerServiceService.selectAllAnnouncement(paging);
		model.addAttribute("pagination", pagination);
		model.addAttribute("announcementList", announcementList);
		return "customerservice/announcement";
	}
	
	//공지사항 작성
	//TODO : 관리자만 가능하게
	@GetMapping("/announcement/write")
	public String announcementWrite() {
		return "customerservice/announcementWrite";
	}
	
	@PostMapping("/announcement/write")
	public String announcementWriteProc(Announcement announcement) {
		customerServiceService.insertAnnouncement(announcement);
		return "redirect:/customerservice/announcement";
	}
	
	//공지사항 세부페이지
	@GetMapping("/announcement/detail")
	public String announcementDetail(@ModelAttribute("page") int page, @RequestParam("id") Integer id, Model model) {
		model.addAttribute("announcement", customerServiceService.findAnnouncementById(id));
		return "customerservice/announcementDetail";
	}
	
	//공지사항 수정
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
	
	//공지사항 삭제
	@GetMapping("/announcement/delete")
	public String announcementDelete(@RequestParam("id")Integer id) {
		customerServiceService.deleteAnnouncement(id);
		return "redirect:/customerservice/announcement";
	}
	
	//오시는길
	@GetMapping("/information")
	public String information() {
		return "customerservice/information";
	}
	
	//문의하기
	@GetMapping("/inquiry")
	public String inquiry(Model model, @ModelAttribute("paging") PagingDto paging, @RequestParam(value="page", 
		    required = false, defaultValue="1")int page) {
		UserDto user = (UserDto)session.getAttribute("user");
		paging.setPage(page);
		paging.setUserId(user.getId());
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		pagination.setArticleTotalCount(customerServiceService.countInquiryPage(paging));
		model.addAttribute("pagination", pagination);
		model.addAttribute("inquiryList", customerServiceService.findInquiry(paging));
		return "customerservice/inquiry";
	}
	
	//문의 작성
	@PostMapping("/inquiry/write")
	public String inquiryWriteProc(Inquiry inquiry) {
		customerServiceService.insertInquiry(inquiry);
		return "redirect:/customerservice/inquiry";
	}
	
	//문의내용
	@GetMapping("/inquiry/detail")
	public String inquiryDetail(@ModelAttribute("page") int page, @RequestParam("id") Integer id, Model model) {
		//문의내용 불러오기
		model.addAttribute("inquiry", customerServiceService.findInquiryById(id));
		model.addAttribute("page", page);
		//답변내용 불러오기
		model.addAttribute("answer", customerServiceService.findInquiryAnswer(id));
		return "customerservice/inquiryDetail";
	}
	
	//문의수정
	@GetMapping("/inquiry/modify")
	public String inquiryModify(@RequestParam("id") Integer id, @RequestParam("page") Integer page, Model model) {
		model.addAttribute("inquiry", customerServiceService.findInquiryById(id));
		model.addAttribute("page", page);
		return "customerservice/inquiryModify";
	}
	
	@PostMapping("/inquiry/modify")
	public String inquiryModifyProc(Inquiry inquiry, @ModelAttribute("page") int page) {
		customerServiceService.updateInquiry(inquiry);
		return "redirect:/customerservice/inquiry/detail?page=" + page + "&id=" + inquiry.getId();
	}
	
	//문의삭제
	@GetMapping("/inquiry/delete")
	public String inquiryDelete(@RequestParam("id")Integer id) {
		customerServiceService.deleteInquiry(id);
		return "redirect:/customerservice/inquiry";
	}
	
	//문의답변
	@PostMapping("/inquiry/answer")
	public String inquiryAnswer(InquiryAnswer inquiryAnswer, Model model, @ModelAttribute("page") int page) {
		customerServiceService.insertInquiryAnswer(inquiryAnswer);
		return "redirect:/customerservice/inquiry/detail?page=" + page + "&id=" + inquiryAnswer.getInquiryId();
	}
	
	@GetMapping("/inquiry/answerDelete")
	public String answerDelete(@RequestParam("id")Integer id, @ModelAttribute("page") int page) {
		customerServiceService.changeAnswer(id);
		customerServiceService.deleteAnswer(id);
		return "redirect:/customerservice/inquiry/detail?page=" + page + "&id=" + id;
	}
}
