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
    display: flex;
    flex-wrap: wrap;
    position: relative;
    align-items: center;
}
.Header {
	position: sticky;
    top: -1px;
    padding-top: 1px;
    z-index: 300;
    color: #fff;
    background: #000;
    transition: transform .3s;
}
.Header_top {
	font: 400 16px/1.56 Roboto,Open Sans,Arial,Helvetica,sans-serif;
    padding: 24px 32px;
    height: calc(1em * 1.71 + 64px);
    justify-content: center;
    align-items: center;
    display: flex;
    flex-wrap: wrap;
    position: relative;
    height: 100%;
}
.Header_home {
	flex: 1 1;
	justify-content: center;
	align-items: center; 
	display: flex;
}
.Header_home h1{
	display: flex;
	margin-left: 210px;
}
.Header_home a {
	text-decoration: inherit;
	color: inherit;
	cursor: pointer;
}
.Header_home img {
	width: 30%;
    display: block;
    margin: 0 auto;
}
.Header_links {
	list-style: none;
	padding: 0;
	text-align: -webkit-match-parent;
	display: flex;
}
.login_btn{
	border: 2px solid #333;
    transition: border-color .15s;
    background-color: var(--color);
    color: #fff;
    padding: 8px 16px;
    text-align: center;
    font-weight: 500;
    margin: 0;
    font: 400 14px/1.57 Roboto,Open Sans,Arial,Helvetica,sans-serif;
    border-radius: calc(16px + 1em * 1.57);
    text-decoration: inherit;
    cursor: pointer;
}
.login_btn:hover {
	border-color: var(--color-hover);
	text-decoration: inherit;
	color: #fff;
}
.btn_label {
	white-space: normal;
    text-decoration: underline;
    -webkit-text-decoration-color: #0000;
    text-decoration-color: #0000;
    transition: -webkit-text-decoration-color .15s;
    transition: text-decoration-color .15s;

}
.signIn_button {
	background-color: var(--color);
	color: #fff;
    padding: 8px 16px;
    text-align: center;
    font-weight: 500;
    transition-property: background-color,color;
    transition-duration: .15s;
    margin: 0;
    font: 400 14px/1.57 Roboto,Open Sans,Arial,Helvetica,sans-serif;
    border-radius: calc(16px + 1em * 1.57);
    text-decoration: inherit;
}
.signIn_button:hover {
	background-color: var(--color-hover);
	text-decoration: inherit;
	color: #fff;
}
.Header_top:after {
	content: "";
    position: absolute;
    bottom: 0;
    height: 1px;
    width: 80%;
    background-color: #222;
}
.HorizontalList {
	position: relative;
    overflow: hidden;
    contain: layout paint;
}
.HorizontalList_container {
	display: flex;
    justify-content: center;
    --distance: calc(calc(var(--line-height, 1.7142857143) * 1em) + 40px);
}
.HorizontalList_track {
	list-style-type: none;
    margin: 0;
    white-space: nowrap;
    width: 40%;
    justify-content: space-between;
    display: flex;
    padding: 0 var(--body-padding);
}
.HorizontalList_item {
	display: flex;
    white-space: nowrap;
    text-align: -webkit-match-parent;
}
.Header_Nav_link {
	transition: color .3s;
    padding: 16px 0;
    text-decoration: inherit;
    color: inherit;
}
.Header_Nav_text {
	flex: 1;
	position: relative;
	font: 18px/1.33 Montserrat,Verdana,sans-serif;
	padding-bottom: 5px;
}
.Header_Nav_text::after {
	content: "";
    position: absolute;
    left: 50%;
    width: 30px;
    bottom: 0;
    max-width: calc(100% - 24px);
    height: 2px;
    background-color: #fff;
    transform: translateX(-50%) scaleX(0);
    transition-property: transform;
    transition-duration: .3s;
}
.Header_Nav_link:hover {
	color: inherit;
	text-decoration: inherit;
}
.Header_Nav_text:hover::after {
    transform: translateX(-50%) scaleX(1);
}
#sliding_menu {
	display:none; 
	width:100%; height:200px;
	position:absolute; left:0; top:78px;
	opacity:1; 
	background: rgba(181,178,255,0.5); 
	padding:5px; margin-right:5px; z-index:9999;
}
#sliding_menu a {
	position:relative;
	left:0px; top:0px;
	margin:0px 10px;
	padding:5px;
	line-height:25px;
}
</style>

</head>

<body>
	<header role = "banner" class = "Header">
		<div class = "Header_top">
			<div class="Header_home">
				<h1>
					<a href="/" style="--ratio:5.230769230769231"><img alt="#" src="/resources/images/htest.jpg" style="width: 30%;"></a>
				</h1>
			</div>
			<ul class="Header_links">
				<li>
					<a href="http://localhost/user/sign-in" style="--color:#000; --color-hover:#fff; margin-right: 20px;" class="login_btn"><span><i class="fa-solid fa-arrow-right-to-bracket"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Login</span></a>
				</li>
				<li>
					<a href="http://localhost/user/sign-up" style="--color:#008573; --color-hover:#0a4f51" class="signIn_button"><span><i class="fa-solid fa-user-plus"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Sign-up</span></a>
				</li>
			</ul>
		</div>
		<nav role="navigation" aria-label="principal" class="Header_Navigation">
			<div class="HorizontalList">
				<div class="HorizontalList_container">
					<ul class="HorizontalList_track">
						<li class="HorizontalList_item"><a class="Header_Nav_link" href="#"><span class="Header_Nav_text">회원</span></a></li>
						<li class="HorizontalList_item"><a class="Header_Nav_link" href="#"><span class="Header_Nav_text">공연/예메</span></a></li>
						<li class="HorizontalList_item"><a class="Header_Nav_link" href="#"><span class="Header_Nav_text">대관</span></a></li>
						<li class="HorizontalList_item"><a class="Header_Nav_link" href="#"><span class="Header_Nav_text"  id="item_customer">고객센터</span></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

<section style="min-height: calc(100vh - 204px);">