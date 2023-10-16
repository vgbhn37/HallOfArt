package com.silver.hallofart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.dto.UserClassificationDto;
import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("")
	public String userAdmin(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
			required = false, defaultValue="1")int page, @RequestParam(value="classification",
			required = false, defaultValue="전체")String classification, @RequestParam(value="searchType",
			required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
			required = false, defaultValue="")String keyword, @RequestParam(value="reset",
			required = false, defaultValue="2")String reset, Model model) {

		log.info("유저 관리 페이지 컨트롤러 호출");

		if(reset.equals("1")) {
			session.removeAttribute("uClassification");
			session.removeAttribute("uSearchType");
			session.removeAttribute("uKeyword");
		}

		paging.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setPaging(paging);

		int count = userService.countUser();
		pagination.setArticleTotalCount(count);

		model.addAttribute("userList", userService.userList(paging));
		model.addAttribute("pagination", pagination);
		
		return "admin/userAdminPage";
	}

	@GetMapping("/classification")
	@ResponseBody
	public UserClassificationDto userClassification(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
			required = false, defaultValue="1")int page, @RequestParam(value="classification",
			required = false, defaultValue="전체")String classification, @RequestParam(value="searchType",
			required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
			required = false, defaultValue="")String keyword) {

		log.info("유저 목록 컨트롤러 호출");

		paging.setPage(page);
		paging.setClassification(classification);
		paging.setKeyword(keyword);
		paging.setSearchType(searchType);

		session.setAttribute("uClassification", classification);
		session.setAttribute("uSearchType", searchType);
		session.setAttribute("uKeyword", keyword);

		Pagination pagination = new Pagination();
		pagination.setPaging(paging);
		UserClassificationDto userclassificationDto = new UserClassificationDto();
		pagination.setArticleTotalCount(userService.countUser());
		//분류가 전체일 떄
		if(classification.equals("전체")) {

			List<UserDto> userList = userService.userList(paging);


			if(!keyword.equals("")) {

				List<UserDto> lastUserList = new ArrayList<>();
				List<UserDto> finalUserList = new ArrayList<>();

				userList = userService.allUserList();
				if(searchType.equals("아이디")) {
					for (UserDto userDto : userList) {
						if(userDto.getUsername().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("이메일")) {
					for (UserDto userDto : userList) {
						if(userDto.getEmail().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("전화번호")) {
					for (UserDto userDto : userList) {
						if(userDto.getTel().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("생년월일")) {
					for (UserDto userDto : userList) {
						if(userDto.getBirthDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("가입일")) {
					for (UserDto userDto : userList) {
						if(userDto.getRegDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else {
					for (UserDto userDto : userList) {
						if(userDto.getUsername().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getEmail().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getTel().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getBirthDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getRegDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				}

				pagination.setArticleTotalCount(lastUserList.size());
				for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastUserList.size()); i++) {
					finalUserList.add(lastUserList.get(i));
				}
				userList = finalUserList;
			}

			userclassificationDto.setUserList(userList);
			userclassificationDto.setPagination(pagination);

			return userclassificationDto;
		}
		//분류값이 있을 때
		else {

			List<UserDto> userList = userService.userListByType(paging);
			pagination.setArticleTotalCount(userService.countUserClassification(paging));

			if(!keyword.equals("")) {

				List<UserDto> lastUserList = new ArrayList<>();
				List<UserDto> finalUserList = new ArrayList<>();

				userList = userService.allUserListByType(classification);

				if(searchType.equals("아이디")) {
					for (UserDto userDto : userList) {
						if(userDto.getUsername().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("이메일")) {
					for (UserDto userDto : userList) {
						if(userDto.getEmail().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("전화번호")) {
					for (UserDto userDto : userList) {
						if(userDto.getTel().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("생년월일")) {
					for (UserDto userDto : userList) {
						if(userDto.getBirthDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else if(searchType.equals("가입일")) {
					for (UserDto userDto : userList) {
						if(userDto.getRegDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				} else {
					for (UserDto userDto : userList) {
						if(userDto.getUsername().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getEmail().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getTel().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getBirthDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						} else if(userDto.getRegDate().toString().contains(keyword)) {
							lastUserList.add(userDto);
						}
					}
				}

				pagination.setArticleTotalCount(lastUserList.size());
				for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastUserList.size()); i++) {
					finalUserList.add(lastUserList.get(i));
				}
				userList = finalUserList;

			}

			paging.setClassification(classification);
			userclassificationDto.setUserList(userList);
			userclassificationDto.setPagination(pagination);

			return userclassificationDto;
		}
	}

	@GetMapping("/detail")
	public String userDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
		model.addAttribute("userDetail", userService.searchId(id));
		return "admin/userAdminDetail";
	}

	@PostMapping("/modify")
	public ResponseEntity<Integer> modifyUserAdmin(UserDto userDto) {

		log.info("관리자 회원정보 수정 컨트롤러 실행");
		log.info("userdto " + userDto);

		userService.moidfyUserAdmin(userDto);

		userDto = userService.searchId(userDto.getId());

		return ResponseEntity.status(HttpStatus.OK).body(200);
	}
	
}
