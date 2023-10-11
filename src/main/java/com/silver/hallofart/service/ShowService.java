package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.dto.Pagination;
import com.silver.hallofart.dto.PagingDto;
import com.silver.hallofart.repository.interfaces.ShowRepository;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.Show;

@Service
public class ShowService {

	@Autowired
	private ShowRepository showRepository;
	
	public Show showById(Integer id){
		Show show = showRepository.findById(id);
		return show;
	}
	
	public List<Show> showListByDate(String date, int offset, int recordSize){
		List<Show> list = showRepository.findByDate(date, offset, recordSize);
		return list;
	}
	
	public int insertShow(Show show) {
		return showRepository.insertShow(show); 
	}
	
	public List<Hall> findHallAll(){
		return showRepository.findHallAll();
	}
	
	public int insertRental(Rental rental) {
		return showRepository.insertRental(rental);
	}
}
