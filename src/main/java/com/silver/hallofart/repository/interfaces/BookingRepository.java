package com.silver.hallofart.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.repository.model.ShowTime;

@Mapper
public interface BookingRepository {
	
	public List<ShowTime> findShowTimeListByShowId(Integer showId);
	public List<SeatStatusDto> findSeatListByShowTimeId(Integer showTimeId);
	public String findHallNameByShowId(Integer showId);
}
