package com.silver.hallofart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.silver.hallofart.dto.ClassificationDto;
import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
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
	@GetMapping("/announcement")
	public String announcement(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page", 
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
		return "customerservice/announcement";
	}
	
	//공지사항 ajax활용
	@GetMapping("/announcement/classification")
	@ResponseBody
	public ClassificationDto announcementClassification(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page", 
		    required = false, defaultValue="1")int page, @RequestParam(value="classification", 
		    required = false, defaultValue="전체")String classification) {
		paging.setPage(page);
		paging.setClassification(classification);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		ClassificationDto classificationDto = new ClassificationDto();
		//분류가 전체일 떄
		if(classification.equals("전체")) {
			pagination.setArticleTotalCount(customerServiceService.countPage(pagination));
			List<Announcement> announcementList = customerServiceService.selectAllAnnouncement(paging);
			classificationDto.setAnnouncementList(announcementList);
			classificationDto.setPagination(pagination);
			return classificationDto;
		} 
		//분류값이 있을 때
		else {
			pagination.setArticleTotalCount(customerServiceService.countPageClassification(paging));
			paging.setClassification(classification);
			List<Announcement> announcementList = customerServiceService.selectAnnouncement(paging);
			classificationDto.setAnnouncementList(announcementList);
			classificationDto.setPagination(pagination);
			return classificationDto;
		}
	}
	
	//공지사항 작성
	@GetMapping("/announcement/write")
	public String announcementWrite() {
		return "customerservice/announcementWrite";
	}
	
	@PostMapping("/announcement/write")
	public String announcementWriteProc(Announcement announcement) {
		//유효성검사
		if(announcement.getTitle() == null || announcement.getTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(announcement.getClassification() == null || announcement.getClassification().isEmpty()) {
			throw new CustomRestfulException("분류값을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(announcement.getContent() == null || announcement.getContent().isEmpty()) {			
			throw new CustomRestfulException("내용을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		customerServiceService.insertAnnouncement(announcement);
		return "redirect:/customerservice/announcement";
	}
	
	//공지사항 세부페이지
	@GetMapping("/announcement/detail")
	public String announcementDetail(@ModelAttribute("page") int page, @RequestParam (value="id", required = false) Integer id, Model model) {
		if(id == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		model.addAttribute("announcement", customerServiceService.findAnnouncementById(id));
		return "customerservice/announcementDetail";
	}
	
	@GetMapping("/announcement/admin")
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
	
	//공지사항 수정
	@GetMapping("/announcement/modify")
	public String announcementModify(@RequestParam("id") Integer id, @RequestParam (value="page", required = false) int page, Model model) {
		if(id == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		model.addAttribute("announcement", customerServiceService.findAnnouncementById(id));
		model.addAttribute("page", page);
		return "customerservice/announcementModify";
	}
	
	@PostMapping("/announcement/modify")
	public String announcementModifyProc(Announcement announcement, int page) {
		//유효성검사
		if(announcement.getTitle() == null || announcement.getTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(announcement.getClassification() == null || announcement.getClassification().isEmpty()) {
			throw new CustomRestfulException("분류값을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(announcement.getContent() == null || announcement.getContent().isEmpty()) {			
			throw new CustomRestfulException("내용을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
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
		model.addAttribute("inquiryList", customerServiceService.findInquiry(user.getId(), paging));
		return "customerservice/inquiry";
	}
	
	//문의 작성
	@PostMapping("/inquiry/write")
	public String inquiryWriteProc(Inquiry inquiry) {
		UserDto user = (UserDto)session.getAttribute("user");
		//유효성검사
		if(inquiry.getTitle() == null || inquiry.getTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(inquiry.getClassification() == null || inquiry.getClassification().isEmpty()) {
			throw new CustomRestfulException("분류값을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(inquiry.getContent() == null || inquiry.getContent().isEmpty()) {			
			throw new CustomRestfulException("내용을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		customerServiceService.insertInquiry(user.getId(),inquiry);
		return "redirect:/customerservice/inquiry";
	}
	
	//문의내용
	@GetMapping("/inquiry/detail")
	public String inquiryDetail(@ModelAttribute("page") int page, @RequestParam (value="id", required = false) Integer id, Model model) {
		if(id == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		//문의내용 불러오기
		model.addAttribute("inquiry", customerServiceService.findInquiryById(id));
		model.addAttribute("page", page);
		//답변내용 불러오기
		model.addAttribute("answer", customerServiceService.findInquiryAnswer(id));
		return "customerservice/inquiryDetail";
	}
	
	//문의수정
	@GetMapping("/inquiry/modify")
	public String inquiryModify(@RequestParam (value="id", required = false) Integer id, @RequestParam(value="page", required = false) Integer page, Model model) {
		if(id == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		if(page == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		model.addAttribute("inquiry", customerServiceService.findInquiryById(id));
		model.addAttribute("page", page);
		return "customerservice/inquiryModify";
	}
	
	@PostMapping("/inquiry/modify")
	public String inquiryModifyProc(Inquiry inquiry, @ModelAttribute("page") int page) {
		//유효성검사
		if(inquiry.getTitle() == null || inquiry.getTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(inquiry.getClassification() == null || inquiry.getClassification().isEmpty()) {
			throw new CustomRestfulException("분류값을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(inquiry.getContent() == null || inquiry.getContent().isEmpty()) {			
			throw new CustomRestfulException("내용을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
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
		//유효성검사
		if(inquiryAnswer.getTitle() == null || inquiryAnswer.getTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(inquiryAnswer.getContent() == null || inquiryAnswer.getContent().isEmpty()) {			
			throw new CustomRestfulException("내용을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		customerServiceService.insertInquiryAnswer(inquiryAnswer);
		return "redirect:/customerservice/inquiry/detail?page=" + page + "&id=" + inquiryAnswer.getInquiryId();
	}
	
	@GetMapping("/inquiry/answerDelete")
	public String answerDelete(@RequestParam (value="id", required = false)Integer id, @ModelAttribute("page") int page) {
		if(id == null) {
			throw new CustomRestfulException("잘못된 접근입니다.", HttpStatus.BAD_REQUEST);
		}
		customerServiceService.changeAnswer(id);
		customerServiceService.deleteAnswer(id);
		return "redirect:/customerservice/inquiry/detail?page=" + page + "&id=" + id;
	}
	
	@GetMapping("/inquiry/admin/main")
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
	@GetMapping("/inquiry/admin/classification")
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
