<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
<style>
	.content{
		width: 85%;
		min-height: 800px;
		padding: 0 40px;
		margin: auto;
		background-color: white;
 		box-shadow: inset 0px 5px 10px 0px rgba(128, 128, 128, 0.3);
		display: flex;
		flex-direction: column;
		overflow: hidden;
	}
	.content-caution{
		border: 1px solid #888;
		width: 80%;
		height: 80%;
		margin: 20px auto;
		padding: 40px;
	}
	.a-div{
		text-align: center;
	}
	.modal-a{
		display: inline-block;
		background-color: white;
		border: 1px solid lightblue;
		width: 60px; height: 40px;
		text-align: center;
		border-radius: 10px;
		font-size: 15px;
		padding-top: 7px;
		margin: 10px 10px auto;
		text-decoration: none;
		color: black;
	}
</style>
<!-- --------------------------------------------------------- -->

<div class="content">
		<h1 style="text-align: center; margin-top: 35px;">주의사항</h1>
	<div class="content-caution">
		<p>
			&nbsp;'HallOfArt' 사이트에서 해당 장소의 대관 및 그 사용 등과 관련하여 필요한 사항의 규정과 준수를 목적으로 하는 내용입니다. 대관 신청 전 숙지 후 참고하여 주시기 바랍니다.
		</p>
			<h3>대관료</h3>
		<p>
			&nbsp;대관료는 기본대관료와 부대설비사용로로 구분하며, 결제는 이를 합한 가격으로 계산됩니다.<br>
			- 기본 대관료란 공연을 위하여 무대 및 공연장의 기본시설을 사용하는 것을 말하며, 공연 준비대관과 공연대관, 철수대관으로 구분합니다.<br>
			- 부대설비사용료란 기본대관료 이외에 대관자의 필요에 의해서 선택하여 사용한 후 추가로 납부하는 대관료를 말합니다.
		</p>
			<h3>대관 승인</h3>
		<p>
			&nbsp;대관은 신청자가 대관 공지 및 접수 일정을 확인한 후, 대관자에게 신청 양식에 맞게 신청 정보를 입력합니다.<br>
			&nbsp;이후 대관자가 승인하여 결제 정보를 요청할 수 있으며 해당 과정까지 시간이 불규칙적으로 소모될 수 있는 점 양해 부탁드립니다.<br>
			&nbsp;대관자는 다음과 같은 경우 대관 신청을 제한할 수 있습니다.<br>
			- 법령을 위반하는 내용의 공연을 목적으로 하는 경우<br>
			- 전당의 시설 및 설비를 심각하게 훼손할 우려가 있거나 부적절한 행사를 목적으로 하는 경우<br>
			- 특정 종교의 포교 또는 정치적인 목적이 명백한 공연과 예술성이 배제된 일반 기념행사<br>
			- 본 규약을 위반하는 행위를 할 우려가 명백한 경우<br>
		</p>
		<p>
			&nbsp;해당 사항 숙지 후 대관을 신청하여 주시길 바랍니다. 아래 대관 가능한 홀을 선택하여 신청 양식을 작성해주세요.
		</p>
		
		<div class="a-div">
			<c:forEach var="hall" items="${halls}">
				<a class="modal-a" href="apply?name=${hall.name}">${hall.name}</a>
			</c:forEach>
		</div>
	</div>
</div>
	
<!-- --------------------------------------------------------- -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
// 버튼 애니메이션
$(".modal-a").hover(
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
</script>
<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp" %>