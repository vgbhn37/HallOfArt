package com.silver.hallofart.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.silver.hallofart.dto.MainShowDto;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.model.Announcement;
import com.silver.hallofart.repository.model.Show;
import com.silver.hallofart.service.CustomerServiceService;
import com.silver.hallofart.service.PaymentService;
import com.silver.hallofart.service.ShowService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private HttpSession session;

	// 추후 showService로 수정
	@Autowired
	private ShowService showService;
	
	@Autowired
	private CustomerServiceService customerService;

	@GetMapping({ "/main", "/" })
	public String main(Model model) {
		log.info("메인 페이지 컨트롤러 실행");
	
		List<MainShowDto> showsList = showService.findShowListOnMain();
		
		if (showsList.isEmpty()) {
			model.addAttribute("showsList", null);
		} else {
			model.addAttribute("showsList", showsList);
		}
		
		List<Announcement> announcementList = customerService.selectMainAnnouncement();
		model.addAttribute("announcementList", announcementList);

		return "main";
	}

}
