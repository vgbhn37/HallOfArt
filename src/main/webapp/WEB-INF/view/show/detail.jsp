<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mid_menu{
 		background-color: white;
		width: 85%;
		height: 80px;
		margin: auto;
		padding: 0 40px;
	}
	body{
		margin: 0; padding: 2px;
		background-color: #444;
	}
	.nav{
		background-color: #444;
		width: 100%;
		height: 100px;
	}
	.detail{
		width: 85%;
		height: 520px;
		background-image: url("https://picsum.photos/2000/600");
		padding: 40px;
		margin: auto;
/* 		display: flex; */
	}
	.detail_left{
		width:50%;
		height:100%;
		float: left;
		padding-top: 20px;
		padding-left: 50px;
	}
	.detail_tb{
 		background-color: rgba(0,0,0,0.3);
		height: 300px;
	}
	.detail_tb td{
		padding: 0 5px;
		color: lightgrey;
	}
	.detail_tb th{
		padding: 0 5px;
		color: white;
		text-align: left;
	}
	.detail_img{
		float: right;
		margin-top: 80px;
		margin-right: 50px;
	}
	
	.detail_content{
		width: 85%;
		height: 1000px;
		padding: 0 40px;
		margin: auto;
		background-color: white;
		box-shadow: inset 0px -10px 10px -10px rgba(128, 128, 128, 0.5);
	}
</style>
</head>
<body>
	<div class="nav">
		<button type="button">메뉴</button>
		<button type="button">로그인</button>
		<button type="button">회원가입</button>
	</div>
	
	<div class="detail">
		<div class="detail_left">
			<h2 style="color: white;">[작품 종류]작품 제목</h2>
			<table class="detail_tb">
				<tr>
					<td>기간</td>
					<th>2023-09-16(토) ~ 2023-09-27(수)</th>
				</tr>
				<tr>
					<td>시간</td>
					<th>10:00 ~ 19:00 (※ 매주 월요일 휴관)</th>
				</tr>
				<tr>
					<td>장소</td>
					<th>한가람미술관 제7전시실</th>
				</tr>
				<tr>
					<td>입장연령</td>
					<th>전체관람</th>
				</tr>
				<tr>
					<td>입장마감</td>
					<th>18:30</th>
				</tr>
				<tr>
					<td>가격</td>
					<th>무료</th>
				</tr>
				<tr>
					<td>주최</td>
					<th>유연홍</th>
				</tr>
				<tr>
					<td>문의</td>
					<th>1668-1352</th>
				</tr>
			</table>
		</div>
		<img class="detail_img" src="https://picsum.photos/200/350">
	</div>
	
	<div class="mid_menu">
	</div>
	<div class="detail_content">
		
	</div>
</body>
</html>