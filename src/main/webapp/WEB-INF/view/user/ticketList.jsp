<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@	include file="/WEB-INF/view/layout/header.jsp"%>
<!-- --------------------------------------------------------- -->
<div class="container my-5">
	<h2>티켓 리스트</h2>
	<hr>

	<c:forEach var="booking" items="${ticketList }">
		<div class="row my-3">
			<div class="col-11">
				<div class="card" style="width: 70%;">
					<div class="card-body">
						<h5 class="card-title">${booking.title }</h5>
						<span class="card-text">${booking.hallName }(${booking.seatName })</span> <span class="card-text"><fmt:formatNumber type="number">${booking.price}</fmt:formatNumber>원</span>
						<p class="card-text">
							공연 일시 :
							<fmt:formatDate value="${booking.startTime}" pattern="yyyy-MM-dd HH:mm" />
						</p>
						
						<c:set var="currentTimeMillis" value="${currentTime.time}" />
						<c:set var="twentyFourHoursAgoMillis" value="${booking.startTime.time - 86400000}" />
						
						<c:if test="${twentyFourHoursAgoMillis > currentTimeMillis }">
							<button type="button" class="btn btn-outline-secondary float-right" onclick="requestRefund(${booking.bookingId})">환불요청</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>


<!-- --------------------------------------------------------- -->
<%@	include file="/WEB-INF/view/layout/footer.jsp"%>

<script>
	function requestRefund(id){
		location.href='/payment/refund/'+id;	
	}
</script>