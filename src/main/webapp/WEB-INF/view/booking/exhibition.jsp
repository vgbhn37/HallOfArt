<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- --------------------------------------------------------- -->

<section style="min-height: calc(100vh - 158.77px);">

	<div class="container" style="margin-top: 60px;">

		<h1 class="title--booking">전시 관람 예약</h1>
		<div style="font-family: 'NanumSquareRound'">

			<div style="background: #FAFAFA; margin-bottom: 40px;">
				<h5>주의 사항</h5>
				<ul>
					<li>관람 예매는 해당 공연일 하루 전까지 가능합니다.</li>
					<li>좌석은 한 번에 1인당 4매까지 예매 가능합니다.</li>
					<li>이 페이지에서 예약 완료 시 좌석은 예매 대기상태가 되며, 30분 이내 결제가 이루어지지 않을 시 자동취소됩니다.</li>
				</ul>
			</div>
			<hr>


			<div class="show_title">
				<h4 style="margin-top: 50px;">${show.title }(${hall.name })</h4>
			</div>
			<hr>
			<div class="row" style="padding: 50px 0; background: #f4f6f2;">
				<div class="col-4" style="border-right: thin solid #888888">
					<img src="/imagePath/${show.showImg}" onerror="this.src='/resources/images/errorImage.png'" style="width: 300px; height: 400px;">
				</div>
				<div class="col-8">
					<label for="time-select">선택 일시 : &nbsp; </label>
					<select class="custom-select" name="showtime" id="time-select" onchange="showBookable(this.value)" style="width: 80%;">
						<option value="" disabled selected>--날짜와 시간을 선택해주세요--</option>
						<c:forEach var="showtime" items="${showTimeList }">
							<option value="${showtime.id }">
								<fmt:formatDate value="${showtime.startTime}" pattern="yyyy-MM-dd HH:mm" />
							</option>
						</c:forEach>
					</select>
					<!-- 티켓 예약 카드-->
					<div id="bookExhibition" style="margin: 50px 0;"></div>
					<!-- 우측 하단 가격 -->
					<div style="position: absolute; right: 71px; bottom: 0px;">
						<span style="font-size: 20px;">결제 금액: </span><span style="font-size: 20px;" id="totalPrice">0</span><span style="font-size: 20px;"> 원</span>
					</div>
				</div>

			</div>
			<div style="text-align: end; margin: 20px 0;">
				<button onclick="moveToBookingSuccessPage()" class="btn btn-primary my-3">예매하기</button>
			</div>
		</div>
	</div>

	<style>
.title--booking {
	position: relative;
	color: #535353;
	font-size: 35px;
	line-height: 35px;
	padding: 5px 0 20px 22px;
	margin-bottom: 35px;
	border-bottom: 1px solid #535353;
}

.title--booking:before {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 12px;
	height: 12px;
	background: #ed1a3b;
	content: "";
}

p {
	margin-bottom: 3px;
}
</style>

</section>
</body>

<!-- --------------------------------------------------------- -->
<footer>
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</footer>
<script>
	
	// 공연과 같은 컨트롤러에서 처리하게 하기 위한 seletedSeat를 담을 배열 선언
	let selectedSeats = new Array();
	
	// 총 가격
	let totalPriceElement = document.getElementById("totalPrice");
	let totalPrice =  parseInt(totalPriceElement.textContent);
	
	// 선택한 시간대 아이디
	let thisShowTimeId = 0;	
	// select box에서 선택된 시간 정보 얻기
	const timeSelect = document.getElementById('time-select');
	let selectedTime = timeSelect.options[timeSelect.selectedIndex].text;
	// option의 value값을 받기 위해 선언
	let showTimeIdValue = 0;
	
		function showBookable(id){
			
			showTimeIdValue = id;
	
			let url = "/booking/showBookableEx?showTimeId=" + id + "&showId=" + ${show.id} 
			
			fetch(url, {method: 'GET'})
			.then(res=> res.json())
			.then(exInfo=>{
				
				// 출력할 곳의 html 클리어
				const exInfoElement = document.getElementById('bookExhibition');
				exInfoElement.innerHTML = '';
				
				// 카드 div
				const exhibitionCard = document.createElement('div');
				exhibitionCard.style.cssText = 'margin: 10px; width: 91%;';
				exhibitionCard.classList.add('card');
				
				// 카드 body 제작
				const cardBody = document.createElement('div');
				cardBody.classList.add('card-body');
				exhibitionCard.appendChild(cardBody);
				
				// 전시 제목 
				const showName = document.createElement('h4');
				showName.classList.add('card-text');
				showName.style.cssText = 'fontweight: bold;';
				showName.textContent = "${show.title}";
				cardBody.appendChild(showName);
				
				// 잔여 예매
				const remainingBookings = document.createElement('span');
				remainingBookings.classList.add('card-text');
				remainingBookings.textContent = "잔여 예매량 : " + exInfo.remaining + " / " + exInfo.maxSeat;
				cardBody.appendChild(remainingBookings);
				
		
				// 매수 select box
			 	const selectQuantity = document.createElement('select');
	
			 	selectQuantity.classList.add("float-right");
			 	selectQuantity.style.cssText = 'margin-right: 30px;';
			 	selectQuantity.setAttribute('id','quantity');
			 		
				for(let i = 1; i<=4; i++){
					let options = document.createElement('option');
					let text = document.createTextNode(i + " 매"); 
					options.value = i;
					options.appendChild(text);
					selectQuantity.appendChild(options);
					if(exInfo.maxSeat - exInfo.remaining + i <= 0 ){
						break;
					} 
				} 
				
				// onchange 달아주기
				selectQuantity.onchange = function() {
				    calcPrice(selectQuantity.value); // 선택한 값을 함수에 전달
				};
				cardBody.appendChild(selectQuantity);
				
				// 최초 기본값이 1매이므로, 1매의 금액을 총 금액에 넣어줌
				totalPrice = ${show.price};
				totalPriceElement.textContent = totalPrice.toLocaleString();
				
				//exInfoElement에 exhibitionCard를 자식으로
				exInfoElement.appendChild(exhibitionCard);
			})
			.catch(error=>{
				console.error(error);
			})
			
		}
	
		// 예매성공 페이지로 이동
	 	function moveToBookingSuccessPage(){
			
			const quantityElement = document.getElementById('quantity');
			
	 		let selectedSeat = {
					showId: ${show.id},
					showTimeId: showTimeIdValue,
					startTime: selectedTime,
					quantity: quantityElement.value	
			}
			
	 		selectedSeats.push(selectedSeat);
			   const requestOptions = {
			        	method: 'POST',
			            headers: {
			                'Content-Type': 'application/json'
			            },
			   			body: JSON.stringify({selectedSeats})
			        };
			   
			   fetch('/booking/book-proc',requestOptions)
			   .then(response => {
				   if (!response.ok) {
		                throw new Error('네트워크 응답 오류');
		            }
				   return response.text();
			   })
			   .then(data => {
				   console.log(data);
				   if(data==='success'){
					   location.href = '/booking/success';
				   } else{
					   alert('좌석 예매 중 오류가 발생했습니다.');
				   }
			   });
		} 
		
		// 총 금액 계산
		function calcPrice(quantity){
			totalPrice= ${show.price} * quantity;
			totalPriceElement.textContent = totalPrice.toLocaleString();
		}
		
		
	</script>

</html>