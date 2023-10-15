package com.silver.hallofart.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.silver.hallofart.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.service.MailService;
import com.silver.hallofart.service.SmsService;
import com.silver.hallofart.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private SmsService smsService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping("/sign-up")
	public String signUp() {
		return "user/signUp";
	}
	
	@GetMapping("/sign-in")
	public String signIn() {
		String uri = request.getHeader("Referer");
		session.setAttribute("beforeLogin", uri);
		return "user/signIn";
	}
	
	@GetMapping("/sign-out")
	public String signOut() {
		session.invalidate();
		return "redirect:/user/sign-in";
	}
	
	@GetMapping("/admin/user")
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

	@GetMapping("/admin/user/classification")
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

	@GetMapping("/admin/user/detail")
	public String userDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
		model.addAttribute("userDetail", userService.searchId(id));
		return "admin/userAdminDetail";
	}

	@PostMapping("/admin/user/modify")
	public ResponseEntity<Integer> modifyUserAdmin(UserDto userDto) {

		log.info("관리자 회원정보 수정 컨트롤러 실행");
		log.info("userdto " + userDto);

		userService.moidfyUserAdmin(userDto);

		userDto = userService.searchId(userDto.getId());

		return ResponseEntity.status(HttpStatus.OK).body(200);
	}

	@GetMapping("/my-info")
	public String myInfo() {
		return "user/myInfo";
	}
	
	@GetMapping("/find-pass")
	public String findInfo() {
		return "user/findPass";
	}
	
	@PostMapping("/find-pass")
	public ResponseEntity<Integer> findPass(UserDto userDto) throws Exception {
		
		log.info("임시 비밀번호 발송 컨트롤러 실행");
//		log.info("userDto : "+userDto);
		
		if(userService.searchUsername(userDto.getUsername())==null) {
			// 존재하지 않는 아이디
			return ResponseEntity.status(HttpStatus.OK).body(500);
		}else {
			UserDto oldUser = userService.searchUsername(userDto.getUsername());
			if(userDto.getTel() == null) { // 이메일로 보내기를 눌렀을 경우
				if(userDto.getEmail().equals(oldUser.getEmail())) {
					String password = mailService.sendTempPassword(userDto.getEmail());
					userService.updatePassByUsername(userDto.getUsername(), password);
					log.info("발급된 임시 비밀번호 : " + password);
					return ResponseEntity.status(HttpStatus.OK).body(400);
				} else {
					// 이메일 불일치
					return ResponseEntity.status(HttpStatus.OK).body(501);
				}
			} else {
				if(userDto.getTel().equals(oldUser.getTel())) {
					
//					사업자번호 이슈로 인한 조치
//					String password = smsService.sendTempPassword(userDto.getTel());
					
					String password = String.valueOf((int) (Math.random() * 99999) + 10000);				
					userService.updatePassByUsername(userDto.getUsername(), password);
					log.info("발급된 임시 비밀번호 : " + password);
					
					return ResponseEntity.status(HttpStatus.OK).body(400);
				} else {
					// 전화번호 불일치
					return ResponseEntity.status(HttpStatus.OK).body(502);
				}
			}
		}
	}
	
	@GetMapping("/find-id")
	public String findId() {
		return "user/findId";
	}
	
	@PostMapping("/find-id")
	public ResponseEntity<String> findIdProcess(UserDto userDto) {
		
		log.info("아이디찾기 컨트롤러 실행");
		log.info("userDto : "+userDto);
		
		String user1;
		String user2;
		
		try {
			UserDto us1 = userService.searchEmail(userDto.getEmail());
			if(us1.getPassword().equals("kakaoUser")) user1 = "카카오로 가입하셨습니다.";
			else user1 = us1.getUsername();
		} catch (Exception e) {
			user1 = "없음";
		}
		
		try {
			UserDto us2 = userService.searchTel(userDto.getTel());
			if(us2.getPassword().equals("kakaoUser")) user2 = "카카오로 가입하셨습니다.";
			else user2 = us2.getUsername();			
		} catch (Exception e) {
			user2 = "없음";
		}
		
		StringBuilder u1 = new StringBuilder(user1);
		StringBuilder u2 = new StringBuilder(user2);
		
		if(!user1.equals("카카오로 가입하셨습니다.")) {
			for (int i = 5; i < u1.length(); i++) {
				u1.setCharAt(i, '*');
			}
		}
		
		if(!user2.equals("카카오로 가입하셨습니다.")) {
			for (int i = 5; i < u2.length(); i++) {
				u2.setCharAt(i, '*');
			}
		}
		
		if(user1.equals("없음") && user2.equals("없음")) {
			return ResponseEntity.status(HttpStatus.OK).body("아이디가 조회되지 않습니다.");			
		} else if(!user1.equals("없음") && !user2.equals("없음") && !(user1.equals(user2))) {
			return ResponseEntity.status(HttpStatus.OK).body("이메일로 조회한 아이디 : "+u1+"<br>전화번호로 조회한 아이디 : "+u2);
		}
		
		if(user1.equals("없음")) return ResponseEntity.status(HttpStatus.OK).body("조회된 회원님의 아이디 : "+u2);
		else return ResponseEntity.status(HttpStatus.OK).body("조회된 회원님의 아이디 : "+u1);
	}
	
	@PostMapping("/sms-confirm")
	@ResponseBody
	int smsConfirm(@RequestParam("tel") String tel) throws Exception {
		
		log.info("가입코드 문자메세지 전송 컨트롤러 실행");
		
//		int code = smsService.send(tel);
//		log.info("인증코드 : " + code);
//		return code;
		
		int code = (int) ((Math.random() * 99999) + 10000);
		log.info("인증코드 : " + code);
		return code; // ==> 인증번호
	}
	
	// 이메일 인증
	@PostMapping("/mail-confirm")
	@ResponseBody
	String mailConfirm(@RequestParam("email") String email) throws Exception {
		
		log.info("가입코드 이메일 전송 컨트롤러 실행");
		
	    String code = mailService.sendSimpleMessage(email);
	    log.info("인증코드 : " + code);
	    return code;
	}
	
	@PostMapping("/duplicate-check")
	public ResponseEntity<Integer> duplicateCheck(@RequestParam("username") String username) {
		
		log.info("아이디 중복체크 컨트롤러 실행");
		
		if(userService.searchUsername(username)!=null) {
			log.info("UserController ====> 아이디 사용불가");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("UserController ====> 아이디 사용가능");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}
	
	@PostMapping("/email-duplicate-check")
	public ResponseEntity<Integer> emailDuplicateCheck(@RequestParam("email") String email) {
		
		log.info("이메일 중복체크 컨트롤러 실행");
		
		if(userService.searchEmail(email)!=null) {
			log.info("UserController ====> 이메일 사용불가");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("UserController ====> 이메일 사용가능");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}
	
	@PostMapping("/tel-duplicate-check")
	public ResponseEntity<Integer> telDuplicateCheck(@RequestParam("tel") String tel) {
		
		log.info("전화번호 중복체크 컨트롤러 실행");
		
		if(userService.searchTel(tel)!=null) {
			log.info("UserController ====> 전화번호 사용불가");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("UserController ====> 전화번호 사용가능");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}
	
	@PostMapping("/sign-up")
	public String signUpProcess(UserDto userDto) {
		
		log.info("회원가입 컨트롤러 실행");
		log.info("userDto : "+userDto);
		
		if(userDto.getUsername() == null || userDto.getUsername().isEmpty()) {
			throw new CustomRestfulException("아이디를 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		if(userDto.getPassword() == null || userDto.getPassword().isEmpty()) {
			throw new CustomRestfulException("패스워드를 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		if(userDto.getBirthDate() == null) {
			throw new CustomRestfulException("생년월일을 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		if(userDto.getEmail() == null || userDto.getEmail().isEmpty()) {
			throw new CustomRestfulException("이메일을 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		if(userDto.getTel() == null || userDto.getTel().isEmpty()) {
			throw new CustomRestfulException("전화번호를 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		
		userService.signUp(userDto);
		
		return "redirect:/user/sign-in";
	}
	
	@PostMapping("/sign-in")
	public String signInProc(UserDto userDto) {
		
		log.info("로그인 컨트롤러 실행");
		
		if(userDto.getUsername() == null || userDto.getUsername().isEmpty()) {
			throw new CustomRestfulException("아이디를 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		
		if(userDto.getPassword() == null || userDto.getPassword().isEmpty()) {
			throw new CustomRestfulException("패스워드를 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		
		UserDto user = userService.signIn(userDto);
		
		log.info("userInfo : " + user);
		
		session.setAttribute("user", user);
		
		
//		관리자 페이지 자동 이동
		
//		if(user.getRoleTypeId() == 2) {
//			return "redirect:/admin/main";
//		}
		
		String uri = (String) session.getAttribute("beforeLogin");
	    if (uri != null && !uri.equals("http://localhost/user/sign-up") && !uri.equals("http://localhost/user/sign-in")) {
	    	return "redirect:"+uri;
	    } else {
	    	return "redirect:/";
	    }
		
	}
	
	@GetMapping("/kakao/callback")
	public String kakaoCallback(@RequestParam String code) {
		
		log.info("카카오 로그인 컨트롤러 실행");
		log.info("카카오 로그인 콜백메서드 동작");
		log.info("카카오 인가 코드 확인 : " + code);
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "a88c60cc6973f14916d03d7bd3f7c2a0");
		params.add("redirect_uri", "http://localhost/user/kakao/callback");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> reqMes = new HttpEntity<>(params, headers);
		
		ResponseEntity<OAuthToken> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, reqMes, OAuthToken.class);
		
		log.info("엑세스 토큰 확인" + response.getBody().toString());
		log.info("----------------------------------------------------");
				
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response.getBody().getAccessToken());
		headers2.add("Content-type", "Content-type: application/x-www-form-urlencoded;charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> kakaoInfo = new HttpEntity<>(headers2);
		
		ResponseEntity<KakaoProfile> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoInfo, KakaoProfile.class);
		
		KakaoProfile kakaoProfile = response2.getBody();
		
		log.info("kakaoProfile : " + kakaoProfile);
	
		String username = kakaoProfile.getId().toString();
		
		UserDto oldUser = userService.searchUsername(username);
		
		if(oldUser == null) {
			
			log.info("가입 이력이 없으므로 카카오 api 정보를 기반으로 회원 가입 진행 후 로그인");
			
			String email = kakaoProfile.getKakaoAccount().getEmail();
			StringBuilder tel = new StringBuilder("99999999999");
			Date date = Date.valueOf("3000-01-01");
			try {
				tel = new StringBuilder(kakaoProfile.getKakaoAccount().getPhoneNumber());
				tel.delete(0, 4);
				tel.insert(0, "0");			
			} catch (Exception e) {
				log.info("전화번호 기본값 삽입");
			}
			try {
				StringBuilder birth = new StringBuilder(kakaoProfile.getKakaoAccount().getBirthYear()+"-"+kakaoProfile.getKakaoAccount().getBirthDay());
				birth.insert(7, "-");
				date = Date.valueOf(birth.toString());
			} catch (Exception e) {
				log.info("생년월일 기본값 삽입");
			}
			
			UserDto userDto = UserDto
					.builder()
					.username(username)
					.password("kakaoUser")
					.email(email)
					.tel(tel.toString())
					.birthDate(date)
					.regDate(Timestamp.valueOf(LocalDateTime.now()))
					.build();
			
			log.info("userDto : " + userDto);
			
			userService.signUp(userDto);
			oldUser = userDto;
		} else {
			log.info("가입된 회원이므로 카카오 로그인 진행");
		}
		
		StringBuilder kakaoName = new StringBuilder(oldUser.getEmail());
		
		for (int i = 0; i < kakaoName.length(); i++) {
			if(kakaoName.charAt(i) == '@') kakaoName.delete(i, kakaoName.length());
		}
		
		oldUser.setUsername(kakaoName.toString());
		
		log.info("user : " + oldUser);
		
		session.setAttribute("user", oldUser);
		
		session.setAttribute("iskakao", true);
		
		String uri = (String) session.getAttribute("beforeLogin");
	    if (uri != null && !uri.equals("http://localhost/user/sign-up") && !uri.equals("http://localhost/user/sign-in")) {
	    	return "redirect:"+uri;
	    } else {
	    	return "redirect:/";
	    }
	}
	
	@PostMapping("/modify-info")
	public String modifyInfo(UserDto userDto) {
		
		log.info("회원정보 수정 컨트롤러 실행");
		
		UserDto oldUser = (UserDto) session.getAttribute("user");
		
		userDto.setId(oldUser.getId());
		
		if(userDto.getPassword() == null || userDto.getPassword().isEmpty()) {
			userDto.setPassword(oldUser.getPassword());
		}
		if(userDto.getBirthDate() == null) {
			userDto.setBirthDate(oldUser.getBirthDate());
		}
		if(userDto.getTel() == null || userDto.getTel().isEmpty()) {
			userDto.setTel(oldUser.getTel());
		}
		
		userService.moidfyUser(userDto);
		
		userDto = userService.searchId(userDto.getId());
		
		//카카오 유저일 경우 아이디가 이메일 자른것이므로 다시 넣어주기
		userDto.setUsername(oldUser.getUsername());
		
		session.setAttribute("user", userDto);
		
		return "redirect:/user/my-info";
	}
	
}
