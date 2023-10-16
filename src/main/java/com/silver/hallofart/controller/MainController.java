package com.silver.hallofart.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.silver.hallofart.repository.model.Show;
import com.silver.hallofart.service.PaymentService;

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
	private PaymentService paymantPaymentService;

	@GetMapping({ "/main", "/" })
	public String main(Model model) {
		log.info("메인 페이지 컨트롤러 실행");

//        List<Show> showsList = mainService.readShowDto();
//        List<Announcement> selectAnnouncement = mainService.selectAnnouncement();
//        model.addAttribute("selectAnnouncement", selectAnnouncement);
//        User principal = (User) session.getAttribute(Define.PRINCIPAL);
//        if (principal == null) {
//            List<RequestShowDto> lists = scheduleService.readShowSchedule();
//            model.addAttribute("lists", lists);
//            model.addAttribute("principal", null);
//        } else if (principal.getRoleId() == 1) {
//            List<RequestShowDto> lists = scheduleService.readShowSchedule();
//            model.addAttribute("lists", lists);
//        }else {
//            List<Notice> noticeList = noticeService.readNotice(principal.getId());
//            List<RequestShowDto> showList = scheduleService.readMyShowSchedule(principal.getId());
//            model.addAttribute("lists", showList);
//            if (noticeList == null || noticeList.size() == 0) {
//                model.addAttribute("noticeList", null);
//                model.addAttribute("message", 0);
//            } else {
//                model.addAttribute("noticeList", noticeList);
//            }
//            model.addAttribute("principal", principal);
//        }
//        if (showsList.isEmpty()) {
//            model.addAttribute("showsList", null);
//        } else {
//            model.addAttribute("showsList", showsList);
//        }

		List<Show> showsList = paymantPaymentService.findShowListOnMain();

		if (showsList.isEmpty()) {
			model.addAttribute("showsList", null);
		} else {
			model.addAttribute("showsList", showsList);
		}

		return "main";
	}

}
