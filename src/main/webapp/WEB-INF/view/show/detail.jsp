<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 0; padding: 2px;
		background-color: #444;
	}
	.nav{
		background-color: #444;
		width: 100%;
		height: 100px;
	}
	.banner{
		width: 85%;
		height: 220px;
		background-image: url("https://picsum.photos/2000/600");
		padding: 40px;
		margin: auto;
	}
	.detail_content{
		width: 85%;
		min-height: 800px;
		background-color: white;
		padding: 40px;
		margin: auto;
		overflow: hidden;
		display: flex;
	}
	.detail_img{
		display: inline-block;
		margin: auto;
		width: 400px;
		height: 600px;
		padding: 10px;
		background-color: lightpink;
		box-sizing: border-box;
	}
	.detail_info{
		display: inline-block;
		margin: auto;
		width: 400px;
		min-height: 600px;
		padding: 30px;
		background-color: lightblue;
		box-sizing: border-box;
	}
	.detail_tb th{
		text-align: left;
	}
</style>
</head>
<body>
	<div class="nav">
		<button type="button">메뉴</button>
		<button type="button">로그인</button>
		<button type="button">회원가입</button>
	</div>
	<div class="banner">
	</div>
<%@ include file="/WEB-INF/view/layout/mid_menu.jsp"%>
	<div class="detail_content">
		<div class="detail_img">
				<img src="https://picsum.photos/400/600" style="width: 100%; height: 100%;">
		</div>
		<div class="detail_info">
			<h2>[작품 종류]${show.title}</h2>
			<p>${show.content}</p>
			<table class="detail_tb">
				<tr>
					<td>기간</td>
					<th>${show.startDate} ~ ${show.endDate}</th>
				</tr>
				<tr>
					<td>시간 ?</td>
					<th>10:00 ~ 19:00 (※ 매주 월요일 휴관)</th>
				</tr>
				<tr>
					<td>장소 ?</td>
					<th>한가람미술관 제7전시실</th>
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
					<td>주최 ?</td>
					<th>유연홍</th>
				</tr>
				<tr>
					<td>문의 ?</td>
					<th>1668-1352</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>