<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<label for="time-select">선택 일시 : </label> <select name="showtime"
				id="time-select" onchange="showSeatList(this.value)">
				<option value="" disabled selected>--날짜와 시간을 선택해주세요--</option>
				<c:forEach var="showtime" items="${showTimeList }">
					<option value="${showtime.id }">
						<fmt:formatDate value="${showtime.startTime}"
							pattern="yyyy-MM-dd HH:mm" />
					</option>
				</c:forEach>
			</select>
			<div class="show_title">
				<span style="font-weight: bold; font-size: large;">${show.title }
					(${hallName })</span>
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
				<div id="selected_seats" class="col-5"
					style="border-left: thin solid #888888;">
					<p style="text-align: center;">선택 된 좌석이 없습니다</p>
				</div>
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
	background-color: ##2287fa;
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
	var showTitle = "${show.title}";
	
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
	                    seatElement.addEventListener('click', () => addSeat(seat.seatName, showtimeId));
	                } else {    
	                    seatElement.classList.add('booked_seat');
	                }
	                seatListDiv.appendChild(seatElement);
	            });
	        })
	        .catch(error => console.error('Error fetching seat list:', error));
	}
		
		// 선택한 좌석에 따라 옆에 나타내기
		function addSeat(seatName, showtimeId){
			var timeSelect = document.getElementById('time-select');
			var selectedTime = timeSelect.options[timeSelect.selectedIndex].text;
			alert(seatName + ',' + selectedTime + ',' + "${hallName}" + ',' + "${show.title}" );
			
			const dataToSend = {
					title: "${show.title}",
					hallName: "${hallName}",
					seatName: seatName,
					startTime: selectedTime
				};

				fetch('/booking/addSeat', {
				    method: 'POST',
				    headers: {
				        'Content-Type': 'application/json'
				    },
				    body: JSON.stringify(dataToSend)
				})
				.then(response => response.json())
				.then(updatedList => {
				    console.log(updatedList);
				})
				.catch(error => console.error('Error updating the list:', error));
		}
		
	</script>

<script src="../resources/js/popper.js"></script>
<script src="../resources/js/main.js"></script>
<script src="../resources/js/jquery.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
</html>