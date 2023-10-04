package com.silver.hallofart.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

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
import org.springframework.web.client.RestTemplate;

import com.silver.hallofart.dto.KakaoProfile;
import com.silver.hallofart.dto.OAuthToken;
import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/sign-up")
	public String signUp() {
		return "user/signUp";
	}
	
	@GetMapping("/sign-in")
	public String signIn() {
		return "user/signIn";
	}
	
	@GetMapping("/sign-out")
	public String signOut() {
		session.invalidate();
		return "redirect:/user/sign-in";
	}
	
	@PostMapping("/sign-up")
	public String signUpProcess(UserDto userDto) {
		
		log.info("userDto : "+userDto);
		
		if(userDto.getUsername() == null || userDto.getUsername().isEmpty()) {
			throw new CustomRestfulException("유저 네임을 입력하십시오", HttpStatus.BAD_REQUEST);
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
			throw new CustomRestfulException("username을 입력하십셔", HttpStatus.BAD_REQUEST);
		}
		
		if(userDto.getPassword() == null || userDto.getPassword().isEmpty()) {
			throw new CustomRestfulException("password을 입력하십셔", HttpStatus.BAD_REQUEST);
		}
		
		UserDto user = userService.signIn(userDto);
		
		log.info("userInfo : " + user);
		
		session.setAttribute("user", user);
		
		return "redirect:/";
		
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
		params.add("client_id", "c61afbe22e42a3267818a8f28f640550");
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
		log.info("response2 : " + response2.getBody().getKakaoAccount().getEmail());
		
		KakaoProfile kakaoProfile = response2.getBody();
		
		log.info("kakaoProfile : " + kakaoProfile);
	
		String username = kakaoProfile.getId().toString();
		String email = kakaoProfile.getKakaoAccount().getEmail();
		StringBuilder tel = new StringBuilder(kakaoProfile.getKakaoAccount().getPhoneNumber());
		tel.delete(0, 4);
		tel.insert(0, "0");
		StringBuilder birth = new StringBuilder(kakaoProfile.getKakaoAccount().getBirthYear()+"-"+kakaoProfile.getKakaoAccount().getBirthDay());
		birth.insert(7, "-");
		Date date = Date.valueOf(birth.toString());
		log.info(""+date);
		
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
		
		UserDto oldUser = userService.searchUsername(userDto.getUsername());
		
		if(oldUser == null) {
			userService.signUp(userDto);
			UserDto user = UserDto
					.builder()
					.username(userDto.getUsername())
					.password(userDto.getPassword())
					.email(userDto.getEmail())
					.tel(userDto.getTel())
					.birthDate(userDto.getBirthDate())
					.regDate(userDto.getRegDate())
					.build();
			oldUser = user;
		}
		
		session.setAttribute("user", oldUser);
		
		return "redirect:/";
	}
	
}
