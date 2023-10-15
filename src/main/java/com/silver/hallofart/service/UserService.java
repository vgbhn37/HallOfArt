package com.silver.hallofart.service;

import java.util.List;

import com.silver.hallofart.dto.PagingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.UserDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.repository.interfaces.UserRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	public List<UserDto> userList(PagingDto paging) {
		return userRepository.findAllUserPaging(paging);
	}
	public List<UserDto> userListByType(PagingDto paging) {
		return userRepository.findAllUserByTypePaging(paging);
	}

	public List<UserDto> allUserList() {
		return userRepository.findAllUser();
	}

	public List<UserDto> allUserListByType(String classification) {
		return userRepository.findAllUserByType(classification);
	}

	@Transactional
	public void signUp(UserDto userDto) {
		int result = userRepository.insert(userDto);
		if(result != 1) {
			throw new CustomRestfulException("가입에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
	public void moidfyUser(UserDto userDto) {
		int result = userRepository.updateById(userDto);
		if(result != 1) {
			throw new CustomRestfulException("회원정보 수정에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@Transactional
	public void moidfyUserAdmin(UserDto userDto) {
		int result = userRepository.updateByIdAdmin(userDto);
		if(result != 1) {
			throw new CustomRestfulException("회원정보 수정에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
	public void updatePassByUsername(String username, String password) {
		int result = userRepository.updatePassByUsername(username, password);
		if(result != 1) {
			throw new CustomRestfulException("임시 비밀번호로 변경에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
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
	
	public UserDto searchTel(String tel) {
		return userRepository.findByTel(tel);
	}
	
	public UserDto searchId(int id) {
		return userRepository.findById(id);
	}
	
	public int countUser() {
		return userRepository.userTotalCount();
	}

	public int countUserClassification(PagingDto paging) {
		return userRepository.userTotalCountClassification(paging);
	}

}
