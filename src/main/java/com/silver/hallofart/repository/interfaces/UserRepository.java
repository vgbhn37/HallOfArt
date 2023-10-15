package com.silver.hallofart.repository.interfaces;

import java.util.List;

import com.silver.hallofart.dto.PagingDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.UserDto;

@Mapper
public interface UserRepository {
	public int insert(UserDto dto);
	public int updateById(UserDto user);
	public int updateByIdAdmin(UserDto user);
	public int updatePassByUsername(@Param("username") String username, @Param("password") String password);
	public int deleteById(Integer id);
	public int userTotalCount();
	public int userTotalCountClassification(PagingDto paging);
	public UserDto findById(Integer id);
	public List<UserDto> findAllUser();
	public List<UserDto> findAllUserByType(String classification);
	public List<UserDto> findAllUserPaging(PagingDto paging);
	public List<UserDto> findAllUserByTypePaging(PagingDto paging);
	public UserDto findByUsernameAndPassword(UserDto signInFormDto);
	public UserDto findByUsername(String username);
	public UserDto findByEmail(String email);
	public UserDto findByTel(String tel);

}
