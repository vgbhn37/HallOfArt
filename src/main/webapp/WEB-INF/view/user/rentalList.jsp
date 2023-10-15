<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@	include file="/WEB-INF/view/layout/header.jsp"%>
<!-- --------------------------------------------------------- -->
<div class="container my-5" style="width: 75%;">
	<h2 class="title--list">대관 신청 리스트</h2>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">상태</th>
				<th scope="col">홀 이름</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
				<th scope="col">가격</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rental" items="${rentalList }">
				<tr>
					<th scope="row">${rental.showStatus }</th>
					<td>${rental.hallName }</td>
					<td>${rental.rentalStartTime }</td>
					<td>${rental.rentalEndTime }</td>
					<td>${rental.amount }</td>
					<c:choose>
						<c:when test="${rental.showStatus=='결제 요청' }">
							<td><img class="kakao-button"
								src="/images/payment_icon_yellow_small.png"
								onclick="moveToKakaoPay(${rental.showTbId})"></td>
						</c:when>
						<c:otherwise>
						</c:otherwise>

					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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

.kakao-button {
	cursor: pointer;
}
</style>
<script>
//로컬 스토리지의 결제 성공값 삭제
if(localStorage.getItem("rentalStatus")=="success"){
	localStorage.removeItem("rentalStatus");
}

// 세션 스토리지의 팝업창 상태 초기화
if(sessionStorage.getItem("rentalPopupStatus")=="popup"){
	sessionStorage.removeItem("rentalPopupStatus");
	location.reload();
}
//결제 팝업창
let paymentPopup;	


function moveToKakaoPay(showTbId){
		
		fetch('/payment/request/'+showTbId,{method: 'GET'})
			.then(res=>{
				if(!res.ok){
					throw new Error('네트워크 연결 오류');
				}
				return res.text();
			})
			.then(url=>{
				paymentPopup = window.open(url, 'PaymentPopup', 'width=600, height=700');
				sessionStorage.setItem("rentalPopupStatus","popup");
				checkPopupClosed();
			})
			.catch(error=>{
				console.error(error);
			});
	}
	
function checkPopupClosed(){
		if(!paymentPopup || paymentPopup.closed){
			
			sessionStorage.removeItem("rentalPopupStatus"); // 팝업창이 닫혔으므로 팝업창 상태를 제거
			if(localStorage.getItem("rentalStatus")=="success"){
				localStorage.removeItem("rentalStatus"); // 성공상태를 수신하였으므로 상태 제거
				location.href='/user/rentalList/' + ${user.id};
			}
			
		}else{
			 setTimeout(checkPopupClosed, 300); 
		}
			
	}
</script>

<!-- --------------------------------------------------------- -->
<%@	include file="/WEB-INF/view/layout/footer.jsp"%>

