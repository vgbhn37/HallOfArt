package com.silver.hallofart.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.dto.HallTimeDto;
import com.silver.hallofart.dto.RentalInfoDto;
import com.silver.hallofart.dto.ShowDetailDto;
import com.silver.hallofart.repository.interfaces.ShowRepository;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.Show;

@Service
public class ShowService {

	@Autowired
	private ShowRepository showRepository;
	
	public ShowDetailDto showById(Integer id){
		return showRepository.findById(id);
	}
	
	public List<Show> showListByDate(String date, int offset, int recordSize){
		return showRepository.findByDate(date, offset, recordSize);
	}
	public List<Show> showListAll(int offset, int recordSize){
		return showRepository.findShowAll(offset, recordSize);
	}
	
	public int insertShow(Show show) {
		return showRepository.insertShow(show); 
	}
	public int insertShowTime(String startTime) {
		return showRepository.insertShowTime(startTime); 
	}
	
	public List<Hall> findHallAll(){
		return showRepository.findHallAll();
	}

	public List<HallTimeDto> findHallTime(String name){
		return showRepository.findHallTime(name);
	}
	
	// 예약 날짜 모두 반환
	public List<String> findAllHallTime(String name){
		

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		List<HallTimeDto> hallTime = findHallTime(name);
		List<String> list = new ArrayList<>();
		
		for (HallTimeDto dto : hallTime) {
	        Timestamp startDate = dto.getStartDate();
	        Timestamp endDate = dto.getEndDate();
	        endDate.setTime(endDate.getTime() + 24 * 60 * 60 * 1000); // 끝날도 포함되도록 +1

	        while (true) {
	            list.add("\""+fmt.format(startDate)+"\"");
	            startDate.setTime(startDate.getTime() + 24 * 60 * 60 * 1000); // 다음 날짜로 이동
	        
	            if (startDate.equals(endDate)) { // equals 메서드로 비교
	                break;
	            }
	        }
	    }
		list.sort(null);
		return list;
	}
	
	public Hall findHallByName(String name){
		return showRepository.findHallByName(name);
	}
	
	public int insertRental(Rental rental) {
		return showRepository.insertRental(rental);
	}
	
	public List<RentalInfoDto> findRentalAll(){
		return showRepository.findRentalAll();
	}
}
