<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@	include file="/WEB-INF/view/layout/header.jsp"%>
<!-- --------------------------------------------------------- -->

<div class="container my-5">
	<h2>결제 대기 리스트</h2>
	<hr>

	<c:forEach var="booking" items="${payList }">
		<div class="row my-3">
			<div class="col-1 d-flex align-items-center justify-content-center">
				<input type="checkbox" id="check-seat" onchange="calcPrice(this,${booking.price},${booking.bookingId})">
			</div>
			<div class="col-11">
				<div class="card" style="width: 70%;">
					<div class="card-body">
						<h5 class="card-title">${booking.title }</h5>
						<span class="card-text">${booking.hallName }(${booking.seatName })</span>
						<span class="card-text"><fmt:formatNumber type="number">${booking.price}</fmt:formatNumber>원</span>
						<p class="card-text">
							공연 일시 :
							<fmt:formatDate value="${booking.startTime}" pattern="yyyy-MM-dd HH:mm" />
						</p>
						<button type="button" class="btn btn-outline-danger float-right" onclick="deleteBooking(${booking.bookingId})">취소</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="my-5" style="width: 73%">
	<span style="font-size: 20px;">결제 금액: </span><span style="font-size: 20px;" id="totalPrice">0</span><span span style="font-size: 20px;"> 원</span>
	<button type="button" class="btn btn-primary float-right" onclick="moveToPayment()">결제하기</button>
	</div>
</div>


<!-- --------------------------------------------------------- -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<style>
 
    #check-seat {
      width: 20px; 
      height: 20px;
    }
 
</style>

<script>
	
	let selectedSeats = new Array();
	
	// 총 가격을 계산
	function calcPrice(checked,price,id){
		
		let totalPriceElement = document.getElementById("totalPrice");
		let totalPrice =  parseInt(totalPriceElement.textContent);
		 if(checked.checked){
			totalPrice+=price;
			addToList(id);
		}else{
			totalPrice-=price;
			removeFromList(id);
		}
		totalPriceElement.textContent = totalPrice.toString();	
	}
	
	//선택 리스트에 추가
	function addToList(id){
		selectedSeats.push(id);
	}
	
	//선택 리스트에서 해제
	function removeFromList(id){
		selectedSeats.splice(selectedSeats.indexOf(id), 1);
	}
	
	function moveToPayment(){
		
	}
	
	function deleteBooking(id){
		
		if(confirm("좌석을 취소하시겠습니까?")){
			fetch('/booking/delete/'+id,{
				method: 'DELETE'
			})
			.then(res => res.text())
			.then(data => {
				if(data==='success'){
					alert('좌석 예매가 취소되었습니다.');
					location.href='/user/payList/'+${user.id};
				} else{
					alert('오류가 발생했습니다.');
					location.href='/user/payList/'+${user.id};
				}
			});	
		}
	}
	
	
</script>