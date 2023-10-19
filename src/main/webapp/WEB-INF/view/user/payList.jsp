<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@	include file="/WEB-INF/view/layout/header.jsp"%>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- --------------------------------------------------------- -->

<section style="min-height: calc(100vh - 158.77px);">
	<div class="container my-5" style="width: 75%;">
		<h1 class="title--list">결제 대기 리스트</h1>
		<hr>

		<c:forEach var="booking" items="${payList }">
			<div class="row my-3" style="font-family: 'NanumSquareRound'">
				<div class="col-1 d-flex align-items-center justify-content-center">
					<input type="checkbox" id="check-seat" onchange="calcPrice(this,${booking.price},${booking.bookingId},${booking.quantity })">
				</div>
				<div class="col-11">
					<div class="card flex-row flex-wrap">
						<div class="card-header border-0">
							<img src="/imagePath/${booking.showImg}" onerror="this.src='/resources/images/errorImage.png'" style="width: 150px; height: 200px;">
						</div>
						<div class="card-body p-5">
						<c:choose>
						<c:when test="${booking.quantity==null }">
							<span class="card-title" style="background-color: lightgrey; padding: 7px 10px; border-radius: 13px; color: white; font-weight: bold; margin-bottom: 20px; margin-top: 10px;"> 공연 </span>
						</c:when>
						<c:otherwise>
							<span class="card-title" style="background-color: lightgrey; padding: 7px 10px; border-radius: 13px; color: white; font-weight: bold; margin-bottom: 20px; margin-top: 10px;"> 전시 </span>
						</c:otherwise>
					</c:choose>
					<br>
					<br>
							<h4 class="card-title pb-3">${booking.title }</h4>
							
							<span class="card-text">${booking.hallName }( <c:choose>
									<c:when test="${booking.quantity==null }">${booking.seatName }</c:when>
									<c:otherwise>${booking.quantity }매</c:otherwise>
								</c:choose> )
							</span> <span class="card-text"><fmt:formatNumber type="number">
									<c:choose>
										<c:when test="${booking.quantity==null }">${booking.price}</c:when>
										<c:otherwise>${booking.price * booking.quantity }</c:otherwise>
									</c:choose>
								</fmt:formatNumber>원</span>
							<p class="card-text">
								공연 일시 :
								<fmt:formatDate value="${booking.startTime}" pattern="yyyy-MM-dd HH:mm" />
							</p>
							<button type="button" class="btn btn-outline-danger float-right" onclick="deleteBooking(${booking.bookingId},'${booking.title}','${booking.seatName}','${booking.startTime}')">취소</button>
						</div>
						<div class="w-100"></div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="my-5" style="width: 100%">
			<span style="font-size: 20px;">결제 금액: </span><span style="font-size: 20px;" id="totalPrice">0</span><span style="font-size: 20px;"> 원</span>
			<div class="button-group float-right">
				<img class="kakao-button" src="/images/payment_icon_yellow_small.png" onclick="moveToKakaoPay()">
			</div>
		</div>

	</div>
	<script>

	//로컬 스토리지의 결제 성공값 삭제
	if(localStorage.getItem("payStatus")=="success"){
		localStorage.removeItem("payStatus");
	}
	
	// 세션 스토리지의 팝업창 상태 초기화
	if(sessionStorage.getItem("popupStatus")=="popup"){
		sessionStorage.removeItem("popupStatus");
		location.reload();
	}
	
	
	// 체크 된 좌석을 담는 배열	
	let selectedSeats = new Array();
	
	// 총 가격
	let totalPriceElement = document.getElementById("totalPrice");
	let totalPrice =  parseInt(totalPriceElement.textContent);
	
	// 결제 팝업 창
	let paymentPopup;
	
	// 각 좌석을 체크, 체크 해제 시 총 가격을 계산
	function calcPrice(checked,price,id,quantity){
		 if(checked.checked){
			 if(quantity==null){
				 totalPrice+= price;	 
			 } else{
				 totalPrice+= price*quantity;
			 }	
			addToList(id);
			
		}else{
			if(quantity==null){
				totalPrice-= price;
			} else{
				totalPrice-= price*quantity;
			}		
			removeFromList(id);
		}
		totalPriceElement.textContent = totalPrice.toLocaleString();	
	}
	
	//선택 리스트에 추가
	function addToList(id){
		selectedSeats.push(id);
	}
	
	//선택 리스트에서 해제
	function removeFromList(id){
		selectedSeats.splice(selectedSeats.indexOf(id), 1);
	}
	
  	// 카카오페이 버튼을 눌렀을 때
  	function moveToKakaoPay(){
  		
  		// 결제금액이 0원일 경우 return
  		if(totalPrice===0){
  			alert('결제하실 좌석을 선택해주세요!');
  			return;
  		}
  		
  		// selectSeats를 body에 담아서 POST
  		const requestOptions = {
  				method: 'POST',
  				headers: {
	                'Content-Type': 'application/json'},
	            body: JSON.stringify({selectedSeats})
  		}
  		fetch('/payment/request',requestOptions)
  			.then(res=>{
  				if(!res.ok){
  					throw new Error('네트워크 연결 오류');
  				}
  				return res.text();
  			})
  			.then(url=>{
  				paymentPopup = window.open(url, 'PaymentPopup', 'width=600, height=700');
  				sessionStorage.setItem("popupStatus","popup");
  				checkPopupClosed();
  			})
  			.catch(error=>{
  				console.error(error);
  			});
  	}
  	
  	// 결제가 성공적으로 이루어지고 팝업이 닫혔을 시, ticketList 페이지로
  	function checkPopupClosed(){
  		if(!paymentPopup || paymentPopup.closed){
  			
  			sessionStorage.removeItem("popupStatus"); // 팝업창이 닫혔으므로 팝업창 상태를 제거
  			if(localStorage.getItem("payStatus")=="success"){
  				localStorage.removeItem("payStatus"); // 성공상태를 수신하였으므로 상태 제거
  				location.href='/user/ticketList/' + ${user.id};
  			}
  			
  		}else{
  			 setTimeout(checkPopupClosed, 300); 
  		}
  			
  	}
  	
 	// 좌석 취소 시
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

</section>
<!-- --------------------------------------------------------- -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<style>
#check-seat {
	width: 20px;
	height: 20px;
}

.kakao-button {
	cursor: pointer;
	margin-right: 8px;
}

.title--list {
	position: relative;
	color: #535353;
	font-size: 35px;
	line-height: 35px;
	padding: 5px 0 20px 22px;
	margin-bottom: 35px;
	border-bottom: 1px solid #535353;
}

.title--list:before {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 12px;
	height: 12px;
	background: #ed1a3b;
	content: "";
}
</style>

