package com.silver.hallofart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.repository.interfaces.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public void signUp(UserDto userDto) {
		int result = userRepository.insert(userDto);
		if(result != 1) {
			throw new CustomRestfulException("가입에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	public UserDto signIn(UserDto userDto) {
		
		UserDto userEntity = userRepository.findByUsername(userDto.getUsername());
		
		if(userEntity == null || !userEntity.getUsername().equals(userDto.getUsername())) {
			throw new CustomRestfulException("존재하지 않는 아이디입니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(!userDto.getPassword().equals(userEntity.getPassword()) ) {
			throw new CustomRestfulException("비밀번호가 틀립니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return userEntity;
	}
	
	public UserDto searchUsername(String username) {
		return userRepository.findByUsername(username);
	}
	
	public UserDto searchEmail(String email) {
		return userRepository.findByEmail(email);
	}
	
}
