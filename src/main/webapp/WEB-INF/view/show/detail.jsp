<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
<style>
	.detail-content{
		display: flex;
		margin: 20px auto;
		justify-content: center;
	}
	.detail_img{
		margin: 50px;
	}
	.detail_info{
		margin: 50px;
	}
	.detail_tb td{
		height: 50px;
	}
	#booking{
		display: block;
		background-color: white;
		border: 1px solid lightblue;
		width: 200px; height: 60px;
		text-align: center;
		border-radius: 10px;
		font-size: 30px;
		padding-top: 7px;
		margin: auto;
		margin-top: 30px;
		text-decoration: none;
		color: black;
	}
</style>
<!-- --------------------------------------------------------- -->
<div class="detail-content">
	<div class="detail_img">
		<img src="/imagePath/${show.showImg}" style="width: 500px; height: 500px;">
	</div>
	<div class="detail_info">
		<h2>
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
		</h2>
		<p>${show.content}</p>
		<table class="detail_tb">
			<tr>
				<td>기간</td>
				<th>${show.startDate} ~ ${show.endDate}</th>
			</tr>
			<tr>
				<td>장소</td>
				<th>${show.name}</th>
			</tr>
			<tr>
				<td>가격</td>
				<th>${show.price} (원)</th>
			</tr>
			<tr>
				<td>공연 정보</td>
				<th>${show.showStatus}</th>
			</tr>
			<tr>
				<td colspan="2">
					<a id="booking" href="#">예매하기</a>
				</td>
			</tr>
		</table>
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
