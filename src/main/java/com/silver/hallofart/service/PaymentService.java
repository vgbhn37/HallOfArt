package com.silver.hallofart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.MainShowDto;
import com.silver.hallofart.dto.PaymentDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.repository.interfaces.BookingRepository;
import com.silver.hallofart.repository.interfaces.PaymentRepository;
import com.silver.hallofart.repository.model.Show;

@Service
public class PaymentService {

	@Autowired
	PaymentRepository paymentRepository;

	@Autowired
	BookingRepository bookingRepository;

	@Transactional
	public void insertPaymentInfo(String tid, String orderNumber, int amount, List<Integer> ids) {

		PaymentDto paymentDto = new PaymentDto();
		paymentDto.setTid(tid);
		paymentDto.setOrderNumber(orderNumber);
		paymentDto.setAmount(amount);

		int result = paymentRepository.insertPaymentInfo(paymentDto);
		if (result != 1) {
			throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}
		for (Integer integer : ids) {
			int result2 = paymentRepository.updatePaymentTidToBooking(tid, integer);
			if (result2 != 1) {
				throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
			}
			int result3 = bookingRepository.updateBookingToSuccess(integer);
			if (result3 != 1) {
				throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
			}
		}

	}

	public String findPaymentTidByBookingId(Integer id) {
		return paymentRepository.findPaymentTidByBookingId(id);
	}

	@Transactional
	public void refundPayment(String tid, int amount, Integer bookId) {

		int result1 = paymentRepository.updateRefundedAmount(tid, amount);
		if (result1 != 1) {
			throw new CustomRestfulException("환불 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}

		int result2 = bookingRepository.updateBookingToRefund(bookId);
		if (result2 != 1) {
			throw new CustomRestfulException("환불 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}
	}

	@Transactional
	public void insertRentalInfo(String rentalTid, String rentalOrderNum, Integer amount, Integer showTbId) {

		PaymentDto paymentDto = new PaymentDto();
		paymentDto.setTid(rentalTid);
		paymentDto.setOrderNumber(rentalOrderNum);
		paymentDto.setAmount(amount);

		int result = paymentRepository.insertPaymentInfo(paymentDto);
		if (result != 1) {
			System.out.println("1번에서 오류 발생");
			throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}

		int result2 = paymentRepository.updatePaymentTidToRental(rentalTid, showTbId);
		if (result2 != 1) {
			System.out.println("2번에서 오류 발생");
			throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}
		int result3 = bookingRepository.updateRentalToSuccess(showTbId);
		if (result3 != 1) {
			System.out.println("3번에서 오류 발생");
			throw new CustomRestfulException("결제 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@Transactional
	public void rentalRefundPayment(String tid, int amount, Integer showTbId) {

		int result1 = paymentRepository.updateRefundedAmount(tid, amount);
		if (result1 != 1) {
			throw new CustomRestfulException("환불 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}

		int result2 = bookingRepository.updateRentalToRefund(showTbId);
		if (result2 != 1) {
			throw new CustomRestfulException("환불 요청에 실패햐였습니다", HttpStatus.BAD_REQUEST);
		}
	}

	public String findPaymentTidByShowId(Integer showTbId) {
		return paymentRepository.findPaymentTidByShowId(showTbId);
	}
	
	public Integer findPriceByPaymentTid(String tid) {
		return paymentRepository.findPriceByPaymentTid(tid);
	}
	
	@Transactional
	public List<MainShowDto> findShowListOnMain(){
		
		List<MainShowDto> list = new ArrayList<>();
		List<Show> showList = paymentRepository.findShowListOnMain();
		for (Show show : showList) {
			MainShowDto dto = new MainShowDto();
			Integer showId = show.getId();
			dto.setId(showId);
			dto.setShowType("공연"); //추후 변경 요망
			dto.setHallName(bookingRepository.findHallNameByShowId(showId));
			dto.setTitle(show.getTitle());
			dto.setStartDate(show.getStartDate());
			dto.setEndDate(show.getEndDate());
			dto.setShowImg(show.getShowImg());
		}
		
		return list;
	}

}
