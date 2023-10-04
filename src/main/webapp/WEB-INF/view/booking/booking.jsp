<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hall Of Art</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	</header>
	<!-- --------------------------------------------------------- -->

	<section style="min-height: calc(100vh - 158.77px);">

		<div class="container" style="margin-top: 60px;">
			<label for="time-select">선택 일시 : </label>
			<select name="showtime" id="time-select" onchange="showSeatList(this.value)">
				<option value="" disabled selected>--날짜와 시간을 선택해주세요--</option>
				<c:forEach var="showtime" items="${showTimeList }">
					<option value="${showtime.id }">
						<fmt:formatDate value="${showtime.startTime}" pattern="yyyy-MM-dd HH:mm" />
					</option>
				</c:forEach>
			</select>
			<div class="show_title">
				<span style="font-weight: bold; font-size: large;">${show.title } (${hallName })</span>
			</div>
			<div class="row" style="padding-top: 50px; border-top: solid;">
				<div id="hall_status" class="col-7">
					<div class="stage">
						<p style="text-align: center;">STAGE</p>
					</div>
					<!-- 좌석리스트 표시 div (ajax) -->
					<div class="seat_list" style="margin-top: 40px;">
						<p style="text-align: center;">공연 시간을 선택해주세요.</p>
					</div>
				</div>
				<!-- 선택한 좌석 표시 div (ajax) -->
				<div id="selected_seats" class="col-5" style="border-left: thin solid #888888;">
					<p style="text-align: center;">선택 된 좌석이 없습니다</p>
				</div>
			</div>
			<div style="text-align: end;">
			<button onclick="moveToBookingPage()" class="btn btn-primary">예매하기</button>
			</div>
		</div>

<style>
.seat {
	background-color: #6610f2;
	font-size: xx-large;
	width: 30px;
	height: 20px;
	margin: 10px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	cursor: pointer;
}

.seat_list {
	margin: auto;
}

.seat:hover {
	background-color: #a06af7;
	font-size: xx-large;
	width: 30px;
	height: 20px;
	margin: 10px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	cursor: pointer;
}

.stage {
	border: 1px solid;
	margin: auto;
	padding: 20px;
	width: 300px;
	height: 80px;
}

.selected_seat {
	background-color: #2287fa;
	font-size: xx-large;
	width: 100px;
	height: 80px;
	margin: 10px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

.booked_seat {
	background-color: #888888;
	font-size: xx-large;
	width: 100px;
	height: 80px;
	margin: 10px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
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
	
	// 좌석 리스트 보여주기
	function showSeatList(showtimeId) {
		if(!showtimeId){
			return;
		}		
	    const requestOptions = {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            }
	        };

	    fetch('/booking/select-time/'+showtimeId , requestOptions)
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
	                // 좌석 상태 클래스 추가
	                if (seat.showTbId == null) {
	                	seatElement.classList.add('seat');
	                    seatElement.addEventListener('click', () => addSeat(seat.seatName,event));
	                 	
	                } else {    
	                    seatElement.classList.add('booked_seat');
	                }
	                seatListDiv.appendChild(seatElement);
	            });
	        })
	        .catch(error => console.error('Error fetching seat list:', error));
	}
		
		// 선택한 좌석에 따라 옆에 나타내기
		function addSeat(seatNameValue,event){
			event.target.classList.replace('seat','selected_seat');
			let timeSelect = document.getElementById('time-select');
			let selectedTime = timeSelect.options[timeSelect.selectedIndex].text;
			//alert(seatName + ',' + selectedTime + ',' + "${hallName}" + ',' + "${show.title}" );
			let selectedSeat = {
					title: "${show.title}",
					hallName: "${hallName}",
					seatName: seatNameValue,
					startTime: selectedTime		
			}
			
			console.log(seatNameValue);
			let flag = true;
			selectedSeats.forEach(seat=>{
				 if(seat.seatName===seatNameValue){
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
		
		function printSelectedSeatList(){
			const output = document.getElementById('selected_seats');
			output.innerHTML = '';
			if(selectedSeats.length===0){
				const alertElement = document.createElement('p');
				alertElement.style.textAlign = 'center';
				alertElement.textContent = '선택 된 좌석이 없습니다.'
				output.appendChild(alertElement);
			} else{
				selectedSeats.forEach(seat => {
					//card 클래스 div 삽입
					const cardDiv = document.createElement('div');
					cardDiv.style.margin = '10px';
					cardDiv.classList.add('card');
					//card-header 클래스 h5에 title과 hallname을 텍스트로 담아 cardDiv의 자식으로
					const cardHeaderElement = document.createElement('h5');
					cardHeaderElement.classList.add('card-header');
					cardHeaderElement.textContent = seat.title + '(${hallName})';
					
					cardDiv.appendChild(cardHeaderElement);
					//card-body 클래스 div를 cardDiv의 자식으로
					const cardBodyDiv = document.createElement('div');
					cardBodyDiv.classList.add('card-body');
					cardDiv.appendChild(cardBodyDiv);
					//card-text 클래스 p를 cardBodyDiv의 자식으로
					//card-text에는 좌석이름, 시간, 취소버튼
					const cardText = document.createElement('span');
					cardText.classList.add('card-text');
					cardText.textContent = seat.seatName + '\u00a0\u00a0' + seat.startTime;
					const cancelBtn = document.createElement('a');
					cancelBtn.classList.add('btn');
					cancelBtn.classList.add('btn-danger');
					cancelBtn.classList.add('btn-sm');
					cancelBtn.style.cursor = 'pointer';
					cancelBtn.textContent = '취소';
					cancelBtn.addEventListener("click",() => subtractSeat(selectedSeats.indexOf(seat)));
					cardDiv.appendChild(cardText);
					cardDiv.appendChild(cancelBtn);
					
					output.appendChild(cardDiv);
				
				});
			}
		}
		
		function moveToBookingPage(){
			alert('딸깍');
		}
		
		
	</script>
	
</html>