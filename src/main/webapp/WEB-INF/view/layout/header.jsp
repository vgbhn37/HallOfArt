<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hall Of Art</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" href="../resources/css/style.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>

<body>
	<section class="ftco-section" style="font-family: 'NanumSquareRound'">
		<div id="header_back"
			style="background-image: linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url('../resources/images/headertest.png'); height: 92px;">
			<div class="container-fluid px-md-5">
				<div class="row justify-content-between">
					<div class="col-md-8 order-md-last">
						<div class="row">
							<div class="col-md-6 text-center">
								<a class="navbar-brand" href="http://localhost/">
								<h1 style="font-weight: 900; color: black">예술의 전당</h1>
									<!-- <span>예매하십셔</span> -->
								</a>
							</div>
							<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
								<form action="#" class="searchform order-lg-last"></form>
							</div>
						</div>
					</div>
					<div class="col-md-4 d-flex">
						<div class="social-media">
							<p class="mx-auto mt-5 d-flex">
								<a href="https://www.facebook.com/SeoulArtsCenter.Korea" target="_blank"
									class="d-flex align-items-center justify-content-center"><span
									class="fa-brands fa-facebook"><i class="sr-only">Facebook</i></span></a> <a
									href="https://twitter.com/I_Love_SAC" target="_blank"
									class="d-flex align-items-center justify-content-center"><span
									class="fa-brands fa-twitter"><i class="sr-only">Twitter</i></span></a> <a
									href="https://www.instagram.com/seoul_arts_center/" target="_blank"
									class="d-flex align-items-center justify-content-center"><span
									class="fa-brands fa-instagram"><i class="sr-only">Instagram</i></span></a>
							</p>
						</div>
					</div>
				</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
<!-- 						<h1 style="font-weight: 900">예술의 전당</h1> -->
					</div>
				</div>
			</div>
			</div>
		</div>
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light"
			id="ftco-navbar" style="background-color: #252525">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="fa fa-bars"></span> 메뉴
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item active"><a href="http://localhost/" class="nav-link" style="color: red">홈</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="#">회원정보</a> <a
									class="dropdown-item" href="#">회원어쩌구</a> <a class="dropdown-item"
									href="#">회원엄준식123</a> <a class="dropdown-item" href="#">회원4</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">예매</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="#">예매1</a> <a
									class="dropdown-item" href="#">예매2</a> <a class="dropdown-item"
									href="#">예매3</a> <a class="dropdown-item" href="#">예매4</a>
							</div></li>
						<li class="nav-item"><a href="#" class="nav-link">오시는길</a></li>
						<li class="nav-item"><a href="#" class="nav-link">문의센터</a></li>
					</ul>
					<ul class="navbar-nav" style="margin-left:-144px">
						<c:choose>
							<c:when test="${empty user}">
								<li class="nav-item"><a href="http://localhost/user/sign-in" class="nav-link">로그인</a></li>
								<li class="nav-item"><a href="http://localhost/user/sign-up" class="nav-link">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${user.roleTypeId == 2}">
										<li class="nav-item"><a href="http://localhost/user/my-info" class="nav-link">관리자 ${user.username}님 환영합니다</a></li>
										<li class="nav-item"><a href="http://localhost/admin/main" class="nav-link">관리 페이지</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a href="http://localhost/user/my-info" class="nav-link">${user.username}님 환영합니다</a></li>
									</c:otherwise>
								</c:choose>
								<li class="nav-item"><a href="http://localhost/user/my-info" class="nav-link">내 정보</a></li>
								<li class="nav-item"><a href="http://localhost/user/sign-out" class="nav-link">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</section>
	
	<section style="min-height: calc(100vh - 204px);">