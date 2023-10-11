package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.dto.ShowDetailDto;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.Show;

@Mapper
public interface ShowRepository {
	public ShowDetailDto findById(Integer id);
	public List<Show> findByDate(@Param("date") String date, @Param("offset") int offset, @Param("recordSize") int recordSize);
	public int insertShow(Show show);
	
	public List<Hall> findHallAll();
	public int insertRental(Rental rental);
	
}
