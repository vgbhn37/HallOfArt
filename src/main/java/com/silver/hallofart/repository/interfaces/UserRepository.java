package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.silver.hallofart.dto.UserDto;

@Mapper
public interface UserRepository {
	public int insert(UserDto dto);
	public int updateById(UserDto user);
	public int deleteById(Integer id);
	public UserDto findById(Integer id);
	public List<UserDto> findAll();
	public UserDto findByUsernameAndPassword(UserDto signInFormDto);
	public UserDto findByUsername(String username);
	public UserDto findByEmail(String email);
	public UserDto findByTel(String tel);
}
