<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin: 0; padding: 2px;
		background-color: #444;
	}
	.nav{
		background-color: #444;
		width: 100%;
		height: 100px;
	}
	.footer{
		background-color: #999;
		width: 100%;
		height: 180px;
	}
	.main_img_slide{
		background-color: pink;
		width: 95%;
		height: 400px;
		margin: auto;
		display: flex;
		overflow: hidden;
	}
	.main_img_menu{
		background-color: lightblue;
		flex: 0 0 100px;
		height: 400px;
	}
	.main_img{
		background-color: maroon;
		height: 100%;
		width: 100%;
	}
	.main_content{
		width: 1000px;
		display: flex;
		margin: 65px auto;
	}
	.main_notice{
		background-color: lightgreen;
		width: 50%;
		height: 350px;
		margin: auto;
		padding: 0 25px;
	}
	.main_rightcontent{
		width: 550px;
	}
	.main_media{
		background-color: lightyellow;
		width: 90%;
		height: 250px;
		margin: auto;
	}
	.main_submenu{
		background-color: grey;
		width: 90%;
		height: 100px;
		margin: auto;
	}
	hr{
		width: 90%;
	}
</style>
</head>
<body>
	<div class="nav">
		<button type="button">메뉴</button>
		<button type="button">로그인</button>
		<button type="button">회원가입</button>
	</div>
	
	<div class="main_img_slide">
		<div class="main_img_menu">
			메뉴
		</div>
		<div class="main_img">
<!-- 			<img src="https://picsum.photos/800/400"> -->
		</div>
	</div>
	
	<div class="main_content">
		<div class="main_notice">
			<a href="#">공지사항</a>
			<a href="#">티켓오픈</a>
			<button type="button">+</button>
			
			<hr>
			<p><a href="#">글목록</a></p><hr><p><a href="#">글목록</a></p><hr><p><a href="#">글목록</a></p><hr><p><a href="#">글목록</a></p><hr>
		</div>
		
		<div class="main_rightcontent">
			<div class="main_media">
				외부링크
			</div>
			
			<div class="main_submenu">
				<a href="#">메뉴</a><a href="#">메뉴</a><a href="#">메뉴</a><a href="#">메뉴</a>
			</div>
		</div>
	</div>
	
	<div class="footer">
		footer
	</div>
</body>
</html>