<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- --------------------------------------------------------- -->

<section style="min-height: calc(100vh - 158.77px);">

	<div class="container" style="margin-top: 60px;">

		<h1 class="title--booking">공연 좌석 예약</h1>
		<div style="font-family: 'NanumSquareRound'">

			<div style="background: #FAFAFA; margin-bottom: 40px;">
				<h5>주의 사항</h5>
				<ul>
					<li>좌석은 한 번에 1인당 10매까지 예매 가능합니다.</li>
					<li>이 페이지에서 예약 완료 시 좌석은 예매 대기상태가 되며, 30분 이내 결제가 이루어지지 않을 시
						자동취소됩니다.</li>
				</ul>
			</div>
			<hr>

			<label for="time-select">선택 일시 : &nbsp; </label> <select class="custom-select" name="showtime"
				id="time-select" onchange="showSeatList(this.value)" style="width: 40%;">
				<option value="" disabled selected>--날짜와 시간을 선택해주세요--</option>
				<c:forEach var="showtime" items="${showTimeList }">
					<option value="${showtime.id }">
						<fmt:formatDate value="${showtime.startTime}"
							pattern="yyyy-MM-dd HH:mm" />
					</option>
				</c:forEach>
			</select>
			<div class="show_title">
				<h4 style="margin-top: 50px;">${show.title }(${hall.name })</h4>
			</div>
			<hr>
			<div class="row" style="padding: 50px 0; background: #f4f6f2;">
				<div id="hall_status" class="col-7">
					<div class="stage">
						<p style="text-align: center;"></p>
					</div>
					<!-- 좌석리스트 표시 div (ajax) -->
					<div class="seat_list"
						style="margin-top: 40px; text-align: center;">
						<p>공연 시간을 선택해주세요.</p>
					</div>
				</div>
				<!-- 선택한 좌석 표시 div -->
				<div id="selected_seats" class="col-5"
					style="border-left: thin solid #888888;">
					<p style="text-align: center;">선택 된 좌석이 없습니다</p>
				</div>
			</div>
			<div style="text-align: end; margin-top: 20px;">
				<button onclick="moveToBookingSuccessPage()" class="btn btn-primary">예매하기</button>
			</div>
		</div>
	</div>

	<style>
.seat {
	background-color: #2E2E2E;
	font-size: x-large;
	width: 20px;
	height: 20px;
	margin: 5px;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	cursor: pointer;
}

.seat_list {
	margin: auto;
}

.seat:hover {
	background-color: #585858;
	font-size: x-large;
	width: 30px;
	height: 20px;
	margin: 5px;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	cursor: pointer;
}

.stage {
	margin: auto;
	padding: 20px;
	width: 330px;
	height: 50px;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.selected_seat {
	background-color: #084B8A;
	font-size: x-large;
	width: 100px;
	height: 80px;
	margin: 5px;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
}

.booked_seat {
	background-color: #888888;
	font-size: x-large;
	width: 100px;
	height: 80px;
	margin: 5px;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
}

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
	// 선택된 좌석 배열 선언
	let selectedSeats = new Array();
	// 선택한 시간대 아이디
	let thisShowTimeId = 0;	
	// select box에서 선택된 시간 정보 얻기
	const timeSelect = document.getElementById('time-select');
	let selectedTime = timeSelect.options[timeSelect.selectedIndex].text;
	// 좌석 리스트 보여주기
	function showSeatList(showTimeId) {
		if(!showTimeId){
			return;
		}
	    const requestOptions = {
	            method: 'GET',
	        };
	    
	    let url = '/booking/selectTime?showTimeId=' + showTimeId +  '&hallId=' + ${hall.id};
	    console.log(url);

	    fetch(url , requestOptions)
	        .then(response => response.json())
	        .then(seatList => {
	            const seatListDiv = document.querySelector('.seat_list');
	            seatListDiv.innerHTML = ''; 
	            
	            seatList.forEach(seat => {  	
	                const seatElement = document.createElement('span');
	                seatElement.setAttribute('id',seat.seatName);
	                //좌석 배치
	                if(seatList.indexOf(seat)%5===0 && seatList.indexOf(seat)%10!==0){
	                	const spaceElement = document.createElement('span');
	                	spaceElement.textContent = "\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0";
	                	seatListDiv.appendChild(spaceElement);
	                	seatElement.textContent = "\u00a0\u00a0\u00a0";
	                } 
	                else if(seatList.indexOf(seat)%10===0){
	                	const newlineElement = document.createElement('span');
	                	newlineElement.textContent = "\n";
	                	seatListDiv.appendChild(newlineElement);
	                	seatElement.textContent = "\u00a0\u00a0\u00a0";
	                } else {
	                	seatElement.textContent = "\u00a0\u00a0\u00a0";
	                }
	                // 선택 된 시간대
	                selectedTime = timeSelect.options[timeSelect.selectedIndex].text;
	                // 이미 선택된 좌석인지 여부 (이미 예매X)
	                let isSelected = false;
	                console.log(selectedTime);
	    			selectedSeats.forEach(selectedSeat=>{
	    				//선택 된 좌석에 좌석의 시간대와 이름이 같은 것이 있으면 
	    				 if(selectedSeat.seatName===seat.seatName && selectedSeat.startTime===selectedTime){
	    					 isSelected = true;
	    				 }
	    			});
	                
	                // 좌석 상태 클래스 추가
	                if (seat.showTbId == null && isSelected===false) {
	                	//예매가 되지 않고 선택도 되지 않은 좌석
	                	seatElement.classList.add('seat');
	                    seatElement.addEventListener('click', () => addSeat(seat.id,seat.seatName,thisShowTimeId,event));
	                 	
	                }
	                else if(seat.showTbId == null && isSelected===true){
	                	//예매가 되지는 않았지만 선택한 좌석 리스트에 있는 좌석
	                	seatElement.classList.add('selected_seat');
	                }
	                else {   
	                	//예매된 좌석
	                    seatElement.classList.add('booked_seat');
	                }
	                seatListDiv.appendChild(seatElement);
	        
	            });
	          //script단에 showTimeid 대입
            thisShowTimeId = showTimeId;
	        })
	        .catch(error => console.error('Error fetching seat list:', error));
	}
		
		// 선택한 좌석에 따라 옆에 나타내기
		function addSeat(seatIdValue,seatNameValue,showTimeIdValue,event){
			// 선택된 좌석이 10개가 넘으면 return
			if(selectedSeats.length>9){
				alert('좌석은 최대 10자리 까지 예매 가능합니다.');
				return;
			}
			
			// 선택된 좌석의 class 바꾸기
			event.target.classList.replace('seat','selected_seat');
			
			// 선택된 좌석 정보
			let selectedSeat = {
					showId: ${show.id},
					seatId: seatIdValue,
					showTimeId: showTimeIdValue,
					title: "${show.title}",
					hallName: "${hallName}",
					seatName: seatNameValue,
					startTime: selectedTime		
			}
			
			// 이미 선택된 좌석을 클릭했을 때 selectedSeats에 추가 되는 것을 방지
			// removeEventListener를 사용하고 싶었으나 말을 듣지 않아서 만듦
			let flag = true;
			selectedSeats.forEach(seat=>{
				 if(seat.seatName===seatNameValue && seat.startTime===selectedTime){
					flag = false;
				 }
			});
			if(flag===true){
				selectedSeats.push(selectedSeat);
			} 
			
			// 선택된 좌석 리스트 출력 함수
			printSelectedSeatList();
		}
		
		function subtractSeat(index){
			let seatName = selectedSeats[index].seatName;
			document.getElementById(seatName).classList.replace('selected_seat','seat');
			selectedSeats.splice(index, 1);
			// 선택된 좌석 리스트 출력 함수
			printSelectedSeatList();
		}
		
		//선택된 좌석 리스트를 출력
		function printSelectedSeatList(){
			//html 출력할 곳의 html 초기화
			const output = document.getElementById('selected_seats');
			output.innerHTML = '';
			//선택된 좌석이 없을 시 표시될 문구
			if(selectedSeats.length===0){
				const alertElement = document.createElement('p');
				alertElement.style.textAlign = 'center';
				alertElement.textContent = '선택 된 좌석이 없습니다.'
				output.appendChild(alertElement);
			} else{
				//선택된 좌석들을 output에 출력
				selectedSeats.forEach(seat => {
					//card 클래스 div 생성
					const cardDiv = document.createElement('div');
					cardDiv.style.margin = '10px';
					cardDiv.classList.add('card');
					
					//card-header 클래스 h5에 title과 hallname을 텍스트로 담아 cardDiv의 자식으로
					const cardHeaderElement = document.createElement('h5');
					cardHeaderElement.classList.add('card-header');
					cardHeaderElement.textContent = seat.title + '(${hall.name})';
					cardDiv.appendChild(cardHeaderElement);
					
					//card-body 클래스 div를 cardDiv의 자식으로
					const cardBodyDiv = document.createElement('div');
					cardBodyDiv.classList.add('card-body');
					cardBodyDiv.classList.add('px-3');
					cardBodyDiv.style.cssText = 'height: 70%;';
					cardDiv.appendChild(cardBodyDiv);
					
					//card-text 클래스 p를 cardBodyDiv의 자식으로
					//card-text에는 좌석이름, 시간, 취소버튼
					const seatNameText = document.createElement('p');
					seatNameText.classList.add('card-text');
					seatNameText.style.cssText = 'font-size: 20px;';
					seatNameText.textContent = seat.seatName;
					const startTimeText = document.createElement('p');
					startTimeText.textContent = seat.startTime;
					const priceText = document.createElement('p');
					priceText.textContent = ${show.price} + ' 원';
					const cancelBtn = document.createElement('a');
					cancelBtn.classList.add('btn');
					cancelBtn.classList.add('btn-outline-danger');
					cancelBtn.classList.add('btn-sm');
					cancelBtn.classList.add('float-right');
					cancelBtn.style.cursor = 'pointer';
					cancelBtn.textContent = '취소';
					cancelBtn.addEventListener("click",() => subtractSeat(selectedSeats.indexOf(seat)));
					cardBodyDiv.appendChild(seatNameText);
					cardBodyDiv.appendChild(startTimeText);
					cardBodyDiv.appendChild(priceText);
					cardBodyDiv.appendChild(cancelBtn);
					
					//output에 cardDiv를 자식으로
					output.appendChild(cardDiv);
				
				});
			}
		}
		
		// 예매성공 페이지로 이동
	 	function moveToBookingSuccessPage(){
			   const requestOptions = {
			        	method: 'POST',
			            headers: {
			                'Content-Type': 'application/json'
			            },
			   			body: JSON.stringify({ selectedSeats })
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
		
		
	</script>

</html>