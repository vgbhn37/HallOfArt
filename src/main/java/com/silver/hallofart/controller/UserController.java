package com.silver.hallofart.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.silver.hallofart.dto.KakaoProfile;
import com.silver.hallofart.dto.OAuthToken;
import com.silver.hallofart.dto.UserDto;
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
	
	@GetMapping("/my-info")
	public String myInfo() {
		return "user/myInfo";
	}
	
	@PostMapping("/sms-confirm")
	@ResponseBody
	int smsConfirm(@RequestParam("tel") String tel) throws Exception {
		
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
	    String code = mailService.sendSimpleMessage(email);
	    log.info("인증코드 : " + code);
	    return code;
	}
	
	@PostMapping("/duplicate-check")
	public ResponseEntity<Integer> duplicateCheck(@RequestParam("username") String username) {
		log.info("UserController ===> duplicateCheck ====> start");
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
		log.info("UserController ===> email duplicateCheck ====> start");
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
		log.info("UserController ===> tel duplicateCheck ====> start");
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
		
		if(userDto.getUsername() == null || userDto.getUsername().isEmpty()) {
			throw new CustomRestfulException("아이디를 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		
		if(userDto.getPassword() == null || userDto.getPassword().isEmpty()) {
			throw new CustomRestfulException("패스워드를 입력하십시오", HttpStatus.BAD_REQUEST);
		}
		
		UserDto user = userService.signIn(userDto);
		
		log.info("userInfo : " + user);
		
		session.setAttribute("user", user);
		
		String uri = (String) session.getAttribute("beforeLogin");
	    if (uri != null && !uri.equals("http://localhost/user/sign-up")) {
	    	return "redirect:"+uri;
	    } else {
	    	return "redirect:/";
	    }
		
	}
	
	@GetMapping("/kakao/callback")
	public String kakaoCallback(@RequestParam String code) {
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
	    if (uri != null && !uri.equals("http://localhost/user/sign-up")) {
	    	return "redirect:"+uri;
	    } else {
	    	return "redirect:/";
	    }
	}
	
	@PostMapping("/modify-info")
	public String modifyInfo(UserDto userDto) {
		
		log.info("회원정보 수정 실행");
		
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
