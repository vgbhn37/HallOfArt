package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.Show;

@Mapper
public interface ShowRepository {
	public Show findById(Integer id);
	public List<Show> findByDate(@Param("startDate") String startDate
												,@Param("endDate") String endDate);
	public int insertShow(Show show);
	
	public List<Hall> findHallAll();
	public int insertRental(Rental rental);
	
}
