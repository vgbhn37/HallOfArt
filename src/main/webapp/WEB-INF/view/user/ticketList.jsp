<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@	include file="/WEB-INF/view/layout/header.jsp"%>
<!-- --------------------------------------------------------- -->
<div class="container my-5" style="width: 75%;">
	<h2 class= "title--list">티켓 리스트</h2>
	<hr>

	<c:forEach var="booking" items="${ticketList }">
			<div class="my-3" style="font-family: 'NanumSquareRound'">
				<div class="card flex-row flex-wrap">
					<div class="card-header border-0">
						<img src="/imagePath/${booking.showImg}" onerror="this.src='/resources/images/errorImage.png'"
							style="width: 150px; height: 200px;">
					</div>
					<div class="card-body p-5">
						<h4 class="card-title pb-3">${booking.title }</h4>
						<span class="card-text">${booking.hallName }(${booking.seatName })</span>
						<span class="card-text"><fmt:formatNumber type="number">${booking.price}</fmt:formatNumber>원</span>
						<p class="card-text">
							공연 일시 :
							<fmt:formatDate value="${booking.startTime}"
								pattern="yyyy-MM-dd HH:mm" />
						</p>
						
						<c:set var="currentTimeMillis" value="${currentTime.time}" />
						<c:set var="twentyFourHoursAgoMillis" value="${booking.startTime.time - 86400000}" />
<!-- 						<a href="/qr/ticket">ticket</a> -->
						<c:if test="${twentyFourHoursAgoMillis > currentTimeMillis }">
							<button type="button" class="btn btn-outline-secondary float-right" onclick="requestRefund(${booking.bookingId},'${booking.title}','${booking.seatName}','${booking.startTime}')">환불요청</button>
						</c:if>
					</div>
					<div class="w-100"></div>
				</div>
			</div>
	</c:forEach>
</div>
<style>
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


<!-- --------------------------------------------------------- -->
<%@	include file="/WEB-INF/view/layout/footer.jsp"%>



<script>
	function requestRefund(id,title,seatName,startTime){
		
		// date
		let date = new Date(startTime);
		// date 포맷
		let formattedDate = date.getFullYear() + '년 ' + (date.getMonth()+1) + '월 ' + date.getDate() + '일 '
							+ date.getHours() + '시 ' + date.getMinutes() + '분 ';
		
		let showInfo = "공연 이름: " + title + "\n공연 시간: " + formattedDate
		+ "\n좌석: " + seatName +"\n----------------------------------------------------";
		if(confirm(showInfo + "\n위의 공연을 환불하시겠습니까?")){
			location.href='/payment/refund/'+id;	
		}
	}
</script>