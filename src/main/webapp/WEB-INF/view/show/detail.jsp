<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
<link rel="stylesheet" href="/resources/css/showDetail.css">
<!-- --------------------------------------------------------- -->
<div class="detail-title-div">
<!-- 	<h1 class="detail-title">공연 정보</h1> -->
	<h1 class="detail-title">
		<c:choose>
			<c:when test="${show.showTypeId1==1}">
					[공연]
			</c:when>
			<c:when test="${show.showTypeId1==2}">
					[전시]
			</c:when>
			<c:otherwise>
					[기타 ( ${show.showTypeId1} ) ]
			</c:otherwise>
		</c:choose>
		${show.title}
	</h1>
</div>
<div class="detail-content">
	<div class="detail_img">
		<img src="/imagePath/${show.showImg}">
	</div>
	<div class="detail_info">
		<div id="in-content-box" style="height: 200px;">
			<p style="white-space: pre-line">${show.content}</p>
		</div>
		<br>	
		<table class="detail_tb">
			<tr>
				<td>기간</td>
				<th>${show.startDate} <br>~ ${show.endDate}</th>
			</tr>
			<tr>
				<td>장소</td>
				<th>${show.name}</th>
			</tr>
			<tr>
				<td>입장 가격</td>
				<th>${show.price} (원)</th>
			</tr>
			<tr>
				<td colspan="2">
					<a id="booking" href="/booking/booking/${show.id }">예매하기</a>
				</td>
			</tr>
		</table>
	</div>
</div>
<div class="detail-title-div">
	<h1 class="detail-title">결제 정보</h1>
</div>
<div class="caution-div">
	<div style="background-color: #f9f6f6; padding: 50px;">
		<h4>결제 안내</h4>
		<p>
			예매 신청 후 결제 대기 리스트에서 결제를 완료해야 정상적으로 티켓이 예매됩니다.<br>
			결제 대기 리스트에서 결제되지 않고 30분이 경과할 경우 자동 취소되며 재예매가 가능합니다.<br>
		</p> 
		<br>
		<h4>결제 수단</h4>
		<p>
			예매 티켓 결제 수단은 아래와 같습니다.<br>
			또한 추후 업데이트로 인해 결제 수단이 추가될 수 있습니다.<br>
		</p>
			<div id="in-content-box">
				<img src="/images/payment_icon_yellow_small.png">
			</div>
		<br>
		<br>
		<h4>예매 및 환불·변경안내</h4>
		<p>
			본 공연은 7세 이상부터 공연 관람이 가능하며, 7세 미만 아동은 보호자를 동반하여도 공연장에 입장할 수 없습니다. (단, 어린이 대상 공연은 제외)<br>
			온라인(PC,모바일) 예매의 경우 1회 10매까지 구매 가능합니다.<br>
			반복하여 예매하기 불편하거나 단체 티켓예매를 원하시면 고객센터 및 문의를 이용해 주시기 바랍니다.<br>
			티켓은 유가증권이므로 분실하였을 경우 재발행 되지 않으며 환불 및 변경이 불가하오니 보관에 유의해주시기 바랍니다.<br>
			지정예매처를 통하지 않고 개인적으로 양도 양수한 티켓에 대해 HallOfArt 는 책임을 지지 않습니다.<br>
		</p>
	</div>
</div>
<!-- --------------------------------------------------------- -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
//게시하기 버튼 애니메이션
$(document).ready(function(){
	$("#booking").hover(
		function(){
			$("#booking").stop().animate({
				backgroundColor: "#cef"
			}, 300 );
		},
		function(){
			$("#booking").stop().animate({
				backgroundColor: "#fff"
			}, 300 );			
		}
	);
});
</script>
<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp" %>
