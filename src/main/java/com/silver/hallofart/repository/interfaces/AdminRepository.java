package com.silver.hallofart.repository.interfaces;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.repository.model.Show;

@Mapper
public interface AdminRepository {
	public List<Show> findAll();
	public int updateStatus(@Param("id") int id, @Param("showStatus") String showStatus);
}
