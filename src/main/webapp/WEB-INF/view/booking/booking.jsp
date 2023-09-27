<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<label for ="time-select">선택 일시 : </label>
		<select name="showtime" id="time-select" onchange="showSeatList(this.value)">
		<option value="" disabled selected>--날짜와 시간을 선택해주세요--</option>
			<c:forEach var="showtime" items="${showTimeList }">
				<option value="${showtime.id }">${showtime.startTime }</option>
			</c:forEach>
		</select>	
		<div class="show_title">
			<span style="font-weight: bold; font-size: large;">쇼 제목(A관)</span>
		</div>
		<div class="row" style="padding-top: 50px; border-top: solid;">
			<div id="hall_status" class="col-7">
				<div class="stage"><p style="text-align: center;">STAGE</p></div>
				<div class="seat_list" style="margin-top: 30px;">
				<c:forEach var="i" begin="0" end="4">
					<c:forEach var="j" begin="0" end="10">
						<c:choose>
							<c:when test="${j==5 }">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:when>
							<c:otherwise>
								<span class="seat">&nbsp;&nbsp;&nbsp;&nbsp;</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<br>
				</c:forEach>
				</div>
			</div>
			<div id="selected_seats" class="col-5" style="border-left: thin solid #888888;">
				<c:choose>
					<c:when test="${seatList==null }">
						<p style="text-align: center;">선택 된 좌석이 없습니다</p>
					</c:when>
					<c:otherwise>
						<c:forEach var="seat" items="${seatList }">
							<p>${seat.name }</p>
						</c:forEach>
					</c:otherwise>
				</c:choose>
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
	cursor: pointer;
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
	<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
</footer>
	<script>
		
		function showSeatList(showTimeId){
			alert(showTimeId);
		}
	</script>
	
	<script src="../resources/js/popper.js"></script>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
</html>