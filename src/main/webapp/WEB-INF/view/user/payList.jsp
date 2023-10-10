<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@	include file="/WEB-INF/view/layout/header.jsp"%>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- --------------------------------------------------------- -->

<div class="container my-5">
	<h2>결제 대기 리스트</h2>
	<hr>

	<c:forEach var="booking" items="${payList }">
		<div class="row my-3">
			<div class="col-1 d-flex align-items-center justify-content-center">
				<input type="checkbox" id="check-seat"
					onchange="calcPrice(this,${booking.price},${booking.bookingId})">
			</div>
			<div class="col-11">
				<div class="card" style="width: 70%;">
					<div class="card-body">
						<h5 class="card-title">${booking.title }</h5>
						<span class="card-text">${booking.hallName }(${booking.seatName })</span>
						<span class="card-text"><fmt:formatNumber type="number">${booking.price}</fmt:formatNumber>원</span>
						<p class="card-text">
							공연 일시 :
							<fmt:formatDate value="${booking.startTime}"
								pattern="yyyy-MM-dd HH:mm" />
						</p>
						<button type="button" class="btn btn-outline-danger float-right"
							onclick="deleteBooking(${booking.bookingId})">취소</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="my-5" style="width: 73%">
		<span style="font-size: 20px;">결제 금액: </span><span
			style="font-size: 20px;" id="totalPrice">0</span><span span
			style="font-size: 20px;"> 원</span>
		<div class="button-group float-right">
			<img class="kakao_button" src="/images/payment_icon_yellow_small.png" onclick="moveToKakaoPay()">
			<button type="button" class="btn btn-primary"
				onclick="moveToPayment()">결제하기</button>
		</div>
	</div>
</div>


<!-- --------------------------------------------------------- -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<style>
#check-seat {
	width: 20px;
	height: 20px;
}

.kakao_button {
	cursor: pointer;
	margin-right: 8px;
}
</style>

<script>

	//새로고침, 뒤로가기 막기
	document.onkeydown = function(e){
 		key = (e) ? e.keyCode : event.keyCode;
 		ctrl = (e) ? e.ctrlKey  : event.ctrlKey;
 
 		if((ctrl == true && (key == 78 || key == 82)) || key==8 || key==116){
    		if(e){
      			e.preventDefault();
    		}
    		else{
          event.keyCode = 0;
          event.returnValue = false;
    		}
  		}
	}
	
	// 결제 객체 초기화
 	//let IMP = window.IMP;
	IMP.init('imp38248863'); 
	
	// 체크 된 좌석을 담는 배열
	let selectedSeats = new Array();
	
	// 총 가격
	let totalPriceElement = document.getElementById("totalPrice");
	let totalPrice =  parseInt(totalPriceElement.textContent);
	
	// 각 좌석을 체크, 체크 해제 시 총 가격을 계산
	function calcPrice(checked,price,id){
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
		IMP.request_pay({
		      pg: "nice_v2.iamport01m",
		      pay_method: "card",
		      merchant_uid: "orderNo0004",
		      name: "예술의전당 티켓예매",
		      amount: totalPrice,
		      buyer_email: "${user.email}",
		      buyer_name: "구매자이름",
		      buyer_tel: "${user.tel}",
		      m_redirect_url: "{모바일에서 결제 완료 후 리디렉션 될 URL}"
		    }, function (rsp) { // callback
		      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		    });
	} 
  	
  	function moveToKakaoPay(){
  		IMP.request_pay({
		      pg: "kakaopay.TC0ONETIME",
		      merchant_uid: "orderNo0004",
		      name: "예술의전당 티켓예매",
		      amount: totalPrice,
		      buyer_email: "${user.email}",
		      buyer_name: "구매자이름",
		      buyer_tel: "${user.tel}",
		      m_redirect_url: "{모바일에서 결제 완료 후 리디렉션 될 URL}"
		    }, function (rsp) { // callback
		      if(rsp.success){
		    	  fetch('/booking/payment_proc', {
		    		  method: 'POST',
		    		  headers: {'Content-Type': 'application/json'
		            },body: JSON.stringify({
		            	imp_uid: rsp.imp_uid,
		                merchant_uid: rsp.merchant_uid
		            })
		    	  }).then(response => {
					   if (!response.ok) {
			                throw new Error('네트워크 응답 오류');
			            }
					   return response.text();
				   }).then(data =>{
					   if(data==='success'){
						   console.log('결제성공');
						   alert('결제가 완료되었습니다.');
					   }else{
						   alert('결제 실패');
					   }
				   })
		      }
		    });
  	
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