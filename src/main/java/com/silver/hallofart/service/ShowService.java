package com.silver.hallofart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silver.hallofart.repository.interfaces.ShowRepository;
import com.silver.hallofart.repository.model.Show;

@Service
public class ShowService {

	@Autowired
	private ShowRepository showRepository;
	
	public Show showById(Integer id){
		Show show = showRepository.findById(id);
		return show;
	}
	
	public List<Show> showListByDate(String startDate, String endDate){
		List<Show> list = showRepository.findByDate(startDate, endDate);
		return list;
	}
	
	public int insertShow(Show show) {
		return showRepository.insertShow(show); 
	}
}
