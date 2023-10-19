package com.silver.hallofart.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silver.hallofart.dto.BookedSeatDto;
import com.silver.hallofart.dto.BookingExhibitionDto;
import com.silver.hallofart.dto.RentalInfoDto;
import com.silver.hallofart.dto.SeatStatusDto;
import com.silver.hallofart.dto.SelectedSeatDto;
import com.silver.hallofart.handler.exception.CustomRestfulException;
import com.silver.hallofart.repository.interfaces.BookingRepository;
import com.silver.hallofart.repository.model.Booking;
import com.silver.hallofart.repository.model.Hall;
import com.silver.hallofart.repository.model.Rental;
import com.silver.hallofart.repository.model.ShowTime;

@Service
public class BookingService {

	@Autowired
	private BookingRepository bookingRepository;

	public List<ShowTime> findShowTime(Integer showId) {

		List<ShowTime> showTimeList = bookingRepository.findShowTimeListByShowId(showId);
		if (showTimeList.isEmpty()) {
			throw new CustomRestfulException("예약할 수 있는 공연이 없습니다", HttpStatus.BAD_REQUEST);
		}
		return showTimeList;
	}

	public List<SeatStatusDto> findSeatListByShowTimeId(Integer showTimeId, Integer hallId) {

		List<SeatStatusDto> seatList = bookingRepository.findSeatListByShowTimeIdAndHallId(showTimeId, hallId);
		if (seatList == null) {
			throw new CustomRestfulException("해당 공연의 좌석 정보를 가져오는 데 실패했습니다.", HttpStatus.BAD_REQUEST);
		}
		return seatList;
	}

	public Hall findHallByShowId(Integer showId) {

		return bookingRepository.findHallByShowId(showId);
	}

	public String findHallNameByShowId(Integer showId) {
		return bookingRepository.findHallNameByShowId(showId);
	}

	public String findShowTitleByBookingId(Integer bookingId) {
		return bookingRepository.findShowTitleByBookingId(bookingId);
	}

	public String findSeatNameByBookingId(Integer bookingId) {
		return bookingRepository.findSeatNameByBookingId(bookingId);
	}

	public int totalPrice(List<Integer> ids) {
		int amount = 0;
		for (Integer integer : ids) {
			Integer quantity = bookingRepository.findBookingById(integer).getQuantity();
			Integer price = bookingRepository.findPriceByBookingId(integer);
			
			if(quantity==null) {
				amount += price;
			}else {
				amount += quantity * price;
			}		
		}
		return amount;
	}

	public int findPriceByBookingId(Integer id) {
		return bookingRepository.findPriceByBookingId(id);
	}

	@Transactional
	public void insertBookingInfo(List<SelectedSeatDto> selectedSeatList, int userId) {

		for (SelectedSeatDto selectedSeatDto : selectedSeatList) {
			
			Integer seatId = selectedSeatDto.getSeatId();
			Integer showId = selectedSeatDto.getShowId();
			Integer ShowTimeId = selectedSeatDto.getShowTimeId();
			Integer quantity = selectedSeatDto.getQuantity();
			Integer count = bookingRepository.findCountBookingByShowTimeId(ShowTimeId);
			Integer maxSeat = bookingRepository.findMaxSeatByShowId(showId);

			// 해당 좌석이 이미 예매 됐을 경우 throw
			if (bookingRepository.findShowTypeByShowId(showId).equals("전시")) {
				if (count+quantity > maxSeat) {
					throw new CustomRestfulException("해당 전시 시간의 예약이 마감되었습니다.", HttpStatus.BAD_REQUEST);
				}

			} else {
				if (bookingRepository.findBookingByshowTimeIdAndseatId(ShowTimeId,
						seatId) != null) {
					throw new CustomRestfulException("이미 예매된 좌석입니다.", HttpStatus.BAD_REQUEST);
				}
			}

			Booking booking = new Booking();
			booking.setSeatTbId(seatId);
			booking.setShowTbId(showId);
			booking.setShowTimeTbId(ShowTimeId);
			booking.setQuantity(quantity);
			booking.setUserTbId(userId);
			booking.setStatus("결제 대기");

			bookingRepository.insertBookingInfo(booking);
		}
	}

	@Transactional
	public List<BookedSeatDto> findpaymentListByUserId(int id) {
		List<BookedSeatDto> findpaymentListByUserId = new ArrayList<>();
		List<Booking> bookingList = bookingRepository.findWaitingPaymentBookingByUserId(id);
		for (Booking booking : bookingList) {
			BookedSeatDto dto = new BookedSeatDto();
			dto.setBookingId(booking.getId());
			dto.setTitle(bookingRepository.findShowTitleByShowId(booking.getShowTbId()));
			dto.setHallName(bookingRepository.findHallNameByShowId(booking.getShowTbId()));
			dto.setSeatName(bookingRepository.findSeatNameBySeatId(booking.getSeatTbId()));
			dto.setShowImg(bookingRepository.findShowImgByshowId(booking.getShowTbId()));
			dto.setPrice(bookingRepository.findPriceByShowId(booking.getShowTbId()));
			dto.setStartTime(bookingRepository.findShowTimeByShowTimeId(booking.getShowTimeTbId()));
			dto.setQuantity(booking.getQuantity());

			findpaymentListByUserId.add(dto);
		}

		return findpaymentListByUserId;
	}

	@Transactional
	public List<BookedSeatDto> findTicketByUserId(int id) {
		List<BookedSeatDto> findTicketByUserId = new ArrayList<>();
		List<Booking> bookingList = bookingRepository.findSuccessPaymentBookingByUserId(id);
		for (Booking booking : bookingList) {
			BookedSeatDto dto = new BookedSeatDto();
			dto.setBookingId(booking.getId());
			dto.setTitle(bookingRepository.findShowTitleByShowId(booking.getShowTbId()));
			dto.setHallName(bookingRepository.findHallNameByShowId(booking.getShowTbId()));
			dto.setSeatName(bookingRepository.findSeatNameBySeatId(booking.getSeatTbId()));
			dto.setShowImg(bookingRepository.findShowImgByshowId(booking.getShowTbId()));
			dto.setPrice(bookingRepository.findPriceByShowId(booking.getShowTbId()));
			dto.setStartTime(bookingRepository.findShowTimeByShowTimeId(booking.getShowTimeTbId()));
			dto.setQuantity(booking.getQuantity());
			findTicketByUserId.add(dto);
		}

		return findTicketByUserId;
	}
	
	@Transactional
	public BookingExhibitionDto findExhibitionInfo(Integer showTimeId, Integer showId) {
		BookingExhibitionDto dto = new BookingExhibitionDto();
		
		Integer total = bookingRepository.findCountBookingByShowTimeId(showTimeId);
		Integer maxSeat = bookingRepository.findMaxSeatByShowId(showId);
		
		dto.setRemaining(maxSeat-total);
		dto.setMaxSeat(maxSeat);
		
		return dto;
	}

	public Timestamp findShowTimeByBookingId(Integer id) {
		return bookingRepository.findShowTimeByBookingId(id);
	}

	public Integer findRentalAmountByShowId(Integer showTbId) {

		return bookingRepository.findRentalAmountByShowId(showTbId);
	}

	public void updateBookingToSuccess(List<Integer> seatIds) {
		for (Integer id : seatIds) {
			bookingRepository.updateBookingToRefund(id);
		}
	}

	public void updateBookingToRefund(Integer id) {
		bookingRepository.updateBookingToRefund(id);
	}

	public int deleteBookingById(Integer id) {
		return bookingRepository.deleteBookingById(id);
	}

	public List<RentalInfoDto> findRentalList(int id) {
		List<RentalInfoDto> findRentalList = new ArrayList<>();
		List<Rental> rentalList = bookingRepository.findRentalByUserId(id);
		for (Rental rental : rentalList) {
			RentalInfoDto dto = new RentalInfoDto();
			Integer showTbId = rental.getShowTbId();
			dto.setShowTbId(showTbId);
			dto.setRentalStartTime(bookingRepository.findStartDateByShowId(showTbId));
			dto.setRentalEndTime(bookingRepository.findEndDateByShowId(showTbId));
			dto.setHallName(bookingRepository.findHallNameByShowId(showTbId));
			dto.setAmount(rental.getAmount());
			dto.setCreatedAt(rental.getCreatedAt());
			dto.setStatus(bookingRepository.findStatusByShowId(showTbId));
			findRentalList.add(dto);
		}
		return findRentalList;
	}
}
