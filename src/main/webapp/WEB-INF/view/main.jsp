<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@	include file="layout/header.jsp"%>
<!-- --------------------------------------------------------- -->


<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cw4qth9oev"></script>
<%--<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&libraries=services"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/inquiry.css">
<link rel="stylesheet" href="/resources/css/information.css">
<style>
.google {
	display: none;
}

.user--btn form {
	margin-top: 18px;
}

.body--content--main {
	background-color: #fff;
}

.showView {
	margin-left: 0;
	border: none;
	width: 300px;
	height: 40px;
	background-color: #DBE4EB;
	cursor: pointer;
}

.slide_wrapper {
	position: relative;
	width: 450px;
	margin: 0 auto;
	height: 200px;
	overflow: hidden;
}

.slides {
	position: absolute;
	left: 0;
	top: 0;
	margin-left: 112px;
}

.slides.animated {
	transition: 0.5s ease-out;
}

.slides li {
	width: 150px;
	height: 200px;
	background: #ccc;
	float: left;
}

.slides li:not(:last-child) {
	margin-right: 30px;
}

.controls {
	text-align: center;
	margin-top: 50px;
}

a {
	text-decoration: none;
	color: #404040;
}

li {
	list-style: none;
}

.main {
	margin: 30px;
}

.main>li {
	position: relative;
	float: left;
	width: 200px;
	margin: -10px 30px;
	height: 60px;
	box-sizing: border-box;
	line-height: 60px;
	text-align: center;
	font-size: 30px;
	height: 60px;
	z-index: 100;
}

.main>li a {
	display: flex;
	display: block;
	transition: all 0.3s;
	z-index: 2;
}

.main>li a:hover {
	background: #909090;
	color: #fff;
}

.sub {
	display: none;
	position: absolute;
	top: 60px;
	left: 0px;
	width: 160px;
	text-align: center;
	background: #eee;
	z-index: 1;
}

.sub li {
	z-index: 1;
	margin-left: -40px;
	font-size: 20px;
}

.title {
	display: flex;
	justify-content: space-between;
	width: 1500px;
	margin: 10px auto;
	margin-left: 100px;
}

.title img {
	margin-left: 30px;
	margin-top: 10px;
}

.user--btn {
	display: flex;
	justify-content: center;
	align-items: center;
}

.user--btn p {
	display: flex;
	justify-content: center;
	align-items: center;
}

.user--btn button {
	height: 46px;
	border-radius: 17px;
	width: 100px;
}

.open-area {
	background-color: #fff;
	border-style: none;
	color: black;
}

.signUp--btn {
	background-color: #fff;
	border-style: none;
	color: black;
}

.login--btn {
	background-color: #fff;
	border-style: none;
	color: black;
}

.logout--btn {
	background-color: #fff;
	border-style: none;
	color: black;
}

button {
	transition: all 0.2s linear;
}

button:hover {
	cursor: pointer;
	transform: scale(1.05);
}

content ul {
	list-style: none;
	height: 600px;
	overflow: hidden;
}

.slider:after {
	content: '';
	display: block;
	clear: both;
}

.slider {
	position: relative;
}

.content {
	/* font-family: 'SDSamliphopangche_Outline'; */
	margin-left: 400px;
	height: 1000px;
	
}

.slider li {
	position: absolute;
	top: 0;
	left: -50px;
	width: 100%;
	height: 200px;
	margin-bottom: 500px;
	opacity: 0;
}

.slider li:first-child {
	z-index: 50;
}

.slider li div {
	width: 100%;
	height: 100%;
	background-size: cover;
}

.slider li div dl {
	position: relative;
	left: 200px;
	top: 230px;
}

.right div {
	display: flex;
	/*flex-direction: flex-start;*/
	align-items: flex-start;
	text-align: left;
	margin-left: 150px;
}

.info {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	text-align: left;
}

.info p {
	color: black;
}

.info h1 {
	width: 600px;
}

.right div img {
	display: flex;
	text-align: center;
	margin-left: 500px;
	cursor: pointer;
}


.right {
	width: 1000px;
	display: flex;
	margin: 0 auto;
}

.slider li dl {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	left: 80px;
}

.slider li .right {
	left: auto;
	right: 20px;
	text-align: right;
}

.slider li dt {
	color: #fff;
	font-size: 3rem;
	text-shadow: 1px 1px 10px #444;
}

.slider li dd {
	color: #fff;
	text-shadow: 1px 1px 10px #444;
}

.btn {
	z-index: 1;
	margin-left: 230px;
	text-align: center;
	width: 200px;
}

.btn button {
	margin: 20px 20px 0 20px;
	border: 1px solid #fff;
	border-radius: 10px;
	color: #666;
	font-size: 1.5rem;
	cursor: pointer;
	background-color: #fff;
	border-radius: 10px;
	background-color: #fff;
}

.slider {
	height: 200px;
}

.content--box {
	width: auto;
	height: 700px;
	border: 1px solid #f7ede4;
	margin: 50px;
	background-color: #2b354e;
	margin-left: -500px;
	color: #f0f0f0;
	overflow: inherit;
}

.slide_wrapper {
	margin-left: 100px;
	margin-top: 200px;
	z-index: 100;
}

.slide_wrapper_box {
	margin-left: 210px;
	width: 300px;
}

.slide_wrapper_box button {
	background-color: #f0f0f0;
}

.footer {
	background-color: #ECECEC;
	display: flex;
	width: 2750px;
	justify-content: center;
	margin-left: -630px;
}

.footer div {
	display: flex;
	margin: 25px auto;
}

.footer div div {
	display: flex;
	margin-left: 20px;
	justify-content: space-around;
	text-align: center;
	flex-direction: column;
	width: 400px;
	flex-direction: column;
}

.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	z-index: 1000;
}

#modal .modal-window {
	background-color: #F8F6F6;
	box-shadow: black;
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid gray;
	width: 410px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: flex;
	width: 200px;
	text-shadow: 1px 1px 1px gray;
	color: black;
	margin: 0;
	margin-left: 170px;
}

#modal .title h2 {
	display: flex;
	justify-content: center;
	margin: 0;
	margin-bottom: 10px;
	margin-right: 50px;
}

#modal .close-area {
	display: flex;
	justify-content: flex-end;
	cursor: pointer;
	padding: 5px 10px;
	border: 1px;
	width: 50px;
}

.close--area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px #fff;
	color: black;
}

.msg {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 350px;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px #A7A7B0;
	color: #45454A;
	font-weight: bold;
	margin-left: 20px;
}

.hidden {
	display: none;
}

.main__notice {
	margin-bottom: 80px;
	margin-left: 120px;
}

.main_notice_title {
	text-align: center;
	border-top: 1px solid #ccc;
	padding-top: 15px;
	font-size: 20px;
	width: 70px;
}

.notice__title {
	display: flex;
	justify-content: space-between;
	width: 1480px;
}

.notice__title h2 {
	font-size: 20px;
}

.notice__content {
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	width: 1480px;
	height: 70px;
}

.notice__content:last-child {
	border-bottom: 1px solid #ccc;
}

.date {
	color: gray;
}

.apilogout {
	margin-top: -20px;
	font-weight: lighter;
	background-color: #FAFAFA;
	color: black;
}

#columnchart_material svg g:nth-child(n+5) text {
	font-size: 14px !important;
}

#user-calendar-container {
	display: flex;
	width: 1500px;
	height: 600px;
	justify-content: space-between;
	align-items: center;
	margin-left: -100px;
}

.main-map {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#nav .main {
	margin-top: 35px;
}

.title .user--btn {
	margin-top: 23px;
}

.user--btn form {
	margin-top: 0;
}

.user--btn a {
	margin-top: 23px;
	margin-top: 0;
	background-color: white;
	font-weight: 400;
	color: #303030;
}

.showView {
	margin-left: 0;
	border: none;
	width: 300px;
	height: 40px;
	background-color: #DBE4EB;
	cursor: pointer;
}

.show-content {
	position: relative;
	max-width: 1280px;
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
}

.fc-event-time {
	font-size: 17px !important;
}

.fc-event-title-container {
	font-size: 17px !important;
}

.modal-content {
	z-index: 1 !important;
}

#myModal {
	z-index: 9999 !important;
}

.fc-daygrid-day-frame fc-scrollgrid-sync-inner {
	z-index: 0 !important;
}

.show-title {
	position: relative;
	font-size: 30px;
	line-height: 35px;
	padding: 5px 0 20px 20px;
	margin-bottom: 30px;
	border-bottom: 1px solid black;
}

.user--btn p {
	margin-top: 2px;
}

.show-title a {
	text-decoration: none;
	color: black;
}

.show-type {
	border-spacing: 0;
}

.show-type-btn {
	border: 0;
	outline: 0;
	background: none;
	font-size: 16px;
	color: gray;
}

.fc-scrollgrid-section fc-scrollgrid-section-body {
	z-index: 100 !important;
}

.fc td {
	padding: 0 !important;
}

.show-type-btn:hover {
	color: black;
	font-weight: bold;
}

#calendar {
	margin-top: 100px;
}

.fc-event-title-container {
	cursor: pointer;
}

.modal {
	display: none;
	position: relative;
	z-index: 2;
	width: 100%;
	left: 500px;
	bottom: 500px;
	background-color: #ccc;
}

.modal-content {
	background-color: white;
	position: fixed;
	border-radius: 10px;
	margin: 15% auto;
	padding: 20px;
	top: 200px;
	z-index: 1;
	border: 1px solid #888;
	width: 300px;
	height: 420px;
}

.modal-content  button {
	display: flex;
	justify-content: center;
	align-items: center;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.imgRoute {
	text-align: center;
}

.modal-title {
	margin-left: 0;
	width: 250px;
	margin: 5px 0px;
	height: 30px;
}

.modal__btn {
	margin-left: 0;
	border: none;
	width: 300px;
	height: 40px;
	background-color: #DBE4EB;
	cursor: pointer;
}

button:hover {
	transform: none;
}

.fc .fc-button-primary {
	background-color: #FAEBD7;
	border: 1px solid #ccc;
	color: black;
}

.fc .fc-button-primary:disabled {
	background-color: #FFCE6B;
	border: 1px solid #ccc;
	color: black;
}

.fc .fc-button-group>.fc-button:focus, .fc .fc-button-group>.fc-button:active,
	.fc .fc-button-group>.fc-button.fc-button-active {
	background-color: #f5de98;
	border: 1px solid #ccc;
	color: black;
}

.fc-toolbar-chunk button {
	background-color: #2b354e !important;
	color: #f0f0f0 !important;
}

/* 지도 */
.way{
	background: #f9f6f6;
	width: 400px;
	height:400px;
    display: flex;
    align-items: center;
}
</style>

<!-- slider  -->
<div class="main--content--div" style="height: 100%; width: 100%">
	<div class="content--box">
		<div class="content">
			<ul class="slider">
				<c:forEach var="showList" items="${showsList}">
					<li>
						<div class="content--info">
							<dl style="top: 300px;" class="right">
								<div class="info">
									<p style="margin-top: 60px; margin-left: -330px; background-color: #fff; border: 1px solid #fff; border-radius: 20px; font-size: 20px; font-weight: 400; padding: 5px 20px;">${showList.showType }</p>
									<h2 style="margin-top: -10px; margin-left: -330px; font-size: 35px; font-weight: 200; margin-bottom: 20px;">🔔️ ${showList.hallName }</h2>
									<h1 style="display: flex; align-items: center; margin-bottom: -180px; margin-left: -330px; font-size: 57px; font-weight: 200; height: 100px;">${showList.title }</h1>
									
										<img style="margin-top: 0px;" src="/imagePath/${showList.showImg}" onerror="this.src='/resources/images/errorImage.png'" onclick="href='/show/detail?id=${showList.id}'" width="480" height="600">
								
								</div>
							</dl>
						</div>
					</li>
				</c:forEach>
			</ul>
			<div class="slide_wrapper_box">
				<div class="slide_wrapper">
					<ul class="slides">
						<c:forEach var="showList" items="${showsList}">
							<li><a href="/show/detail?id=${showList.id}">
									<img src="/imagePath/${showList.showImg}" onerror="this.src='/resources/images/errorImage.png'" width="150" height="200">
								</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="btn">
					<button type="button" id="prev" class="button"><</button>
					<button type="button" id="next" class="button">></button>
				</div>
			</div>
		</div>
	</div> <!-- end of slide -->
	<%--	<c:choose>--%>
	<%--		<c:when test="${principal.roleId==2 && message!=0}">--%>
	<%--			<div id="modal" class="modal-overlay">--%>
	<%--				<div class="modal-window">--%>
	<%--					<div class="title">--%>
	<%--						<div>--%>
	<%--							<h2>알림</h2>--%>
	<%--						</div>--%>
	<%--						<div class="close-area" style="color: black">X</div>--%>
	<%--					</div>--%>
	<%--&lt;%&ndash;					<c:forEach var="noticeList" items="${noticeList}">&ndash;%&gt;--%>
	<%--						<div class="content" style="display: flex; justify-content: space-between;">--%>
	<%--							<div class="msg">${noticeList.notice}</div>--%>
	<%--							<form action="/managerNotice/update/${noticeList.id}" method="get">--%>
	<%--								<div class="close-area">--%>
	<%--									<button type="submit" class="close-area" style="border: 1px solid gray; border-radius: 10px; background-color: #eee;">확인</button>--%>
	<%--								</div>--%>
	<%--							</form>--%>
	<%--						</div>--%>

	<%--&lt;%&ndash;					</c:forEach>&ndash;%&gt;--%>
	<%--				</div>--%>
	<%--			</div>--%>
	<%--		</c:when>--%>
	<%--	</c:choose>--%>

	<%--	<c:choose>--%>
	<%--		<c:when test="${pricipal!=null || principal.roleId==2}">--%>
	<%--			<div class="show-content">--%>
	<%--				<div class="modal" id="myModal">--%>
	<%--					<div class="modal-content">--%>
	<%--						<span class="close" id="close" onclick="close()">&times;</span> <input type="hidden" class="showId" id="showId" name="showId">--%>
	<%--						<h3 class="modal-title" id="title"></h3>--%>
	<%--						<span class="showDate" id="showDate"></span> <span class="showTime" id="showTime"></span>--%>
	<%--						<p class="holeName" id="holeName"></p>--%>
	<%--						<p class="imgRoute" id="imgRoute">--%>
	<%--							<img alt="" id="images" width="210" , height="280">--%>
	<%--						</p>--%>
	<%--						<button class="showView" id="showView" onclick="showView()" style="text-align: center;">자세히보기</button>--%>
	<%--					</div>--%>
	<%--				</div>--%>

	<%--				<div id='calendar-container' style="display: flex; width: 1500px; justify-content: space-between; align-items: center; margin-left: -100px;">--%>
	<%--					<div id='calendar' style="width: 800px; height: 500px; margin-top: 0;"></div>--%>
	<%--					<div class="card-body" style="width: 750px; height: 625px; margin-left: 50px; margin-top: 30px;">--%>
	<%--						<canvas id="myBarChart" width="750px;" height="625px;"></canvas>--%>
	<%--					</div>--%>
	<%--				</div>--%>
	<%--			</div>--%>
	<%--		</c:when>--%>
	<%--		<c:otherwise>--%>
<%-- 	<div class="show-content">
		<div class="modal" id="myModal">
			<div class="modal-content" style="margin: 0;">
				<span class="close" id="close" onclick="close()">&times;</span>
				<input type="hidden" class="showId" id="showId" name="showId">
				<h3 class="modal-title" id="title"></h3>
				<span class="showDate" id="showDate"></span> <span class="showTime" id="showTime"></span>
				<p class="holeName" id="holeName"></p>
				<p class="imgRoute" id="imgRoute">
					<img alt="" id="images" width="210" height="280">
				</p>
				<button class="showView" id="showView" onclick="showView()" style="text-align: center;">자세히보기</button>
			</div>
		</div>

		<div id='user-calendar-container'>
			<div id='userCalendar' style="width: 700px; height: 600px;"></div>
			<div class="main-map">
				<h2>찾아오시는 길</h2>
					<div class="way">
						<div style="width: 5%"></div>
						<div id="map"></div>
						<div style="width: 10%"></div>
					</div>
			</div>
		</div>
	</div>
			</c:otherwise>--%>
	<%--	</c:choose>--%>




<%-- 	<div class="main__notice">
		<div class="main_notice_title">
			<span>Notice</span>
		</div>
		<div class="notice__title">
			<h1>공지사항</h1>
			<h1>
				<a href="/announcement">더보기 +</a>
			</h1>
		</div>
		<div class="no_content">
			<a href="/announcement">
								<c:forEach var="selectAnnouncement" items="${selectAnnouncement}">
				<div class="notice__content">
					<ul style="padding: 0 20px;">
													<li class="item"><span style="font-size: 30px;">${selectAnnouncement.title}</span></li>
						<li class="item"><span style="font-size: 30px;">공지사항 제목</span></li>
					</ul>
				</div>
								</c:forEach>
			</a>
		</div>
	</div> --%>
</div>
<!-- 공지사항 + 찾아오시는 길  -->
<div class="row">
	<!-- 공지사항  -->
	<div style="width: 40%; margin-left: 80px; margin-bottom: 50px;">
		<h1 class="title--inquiry" style="margin-top: 120px;">공지사항</h1>
	    <table class="table">
			<tbody id="inquiry-list-container">
				<c:forEach var="announcement" items="${announcementList}">
					<tr>
						<td><a href="/customerservice/inquiry/detail?id=${announcement.id}">${announcement.title}</a></td>
						<td><a href="#">${announcement.createdAt}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="width:7%"></div>
	<!-- 오시는길  -->
	<div style="width: 40%; margin-right: 80px; margin-bottom: 50px;">
		<h1 class="title--way" style="margin-top: 120px !important;">오시는길</h1>
		<div class="way" style="width:100%; height: 350px;">
			<div style="width:5%;"></div>
			<div id="map" style="width:90%;  height: 300px;"></div>
		</div>
	</div>
</div> <!-- end of announce, info -->


<script>

	//모달창
	const modal = document.querySelector(".modal-overlay")
	function init() {
		$(".close-area").click(function() {
			modal.classList.add("hidden");
		});
		$(".open-area").click(function() {
			modal.classList.remove("hidden");
		});
	}
	init();

	// 중복 클릭 방지
	$(".button").on("click", function() {
		$(this).attr("disabled", true);
		setTimeout(function() {
			$(".button").attr("disabled", false);
		}, 550);
	});

	// 상단 메뉴바 드롭다운
	$(document).ready(function() {
		$(".main>li").mouseover(function() {
			$(this).children(".sub").stop().slideDown(200);
		});
		$(".main>li").mouseleave(function() {
			$(this).children(".sub").stop().slideUp(200);
		});
	});

	// 이미지 흘러가기 기능 구현
	var slides = document.querySelector('.slides'),
			slide = document.querySelectorAll('.slides li'),

			currentIdx = 0,
			slideCount = $('.slides li').length,
			slideWidth = 150,
			slideMargin = 30,
			prevBtn = document.querySelector('.prev'),
			nextBtn = document.querySelector('.next');
	makeClone();

	function makeClone() {
		for (let i = 0; i < slideCount; i++) {
			let cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			slides.appendChild(cloneSlide);
		}
		for (let i = slideCount - 1; i >= 0; i--) {
			let cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			slides.prepend(cloneSlide);
		}
		updateWidth();
		setInitialPos();
		setTimeout(function() {
			slides.classList.add('animated');
		}, 100);
	}

	function updateWidth() {
		var currentSlides = document.querySelectorAll('.slides li');
		var newSlideCount = currentSlides.length;

		var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';
		slides.style.width = newWidth;
	}
	function setInitialPos() {
		var initialTranslateValue = -(slideWidth + slideMargin) * slideCount;
		slides.style.transform = 'translateX(' + initialTranslateValue + 'px)';
	}

	function moveSlide(num) {
		slides.style.left = - num * (slideWidth + slideMargin) + 'px';
		currentIdx = num;



		if (currentIdx == slideCount || currentIdx == -slideCount) {

			setTimeout(function() {
				slides.classList.remove('animated');
				slides.style.left = '0px';
				currentIdx = 0;
			}, 500);
			setTimeout(function() {
				slides.classList.add('animated');
			}, 600);

		}

	}

	// 슬라이드 뒷 배경
	$(function() {
		var $slider = $('.slider'),
				$firstSlide = $slider.find('li').first() // 첫번째 슬라이드
						.stop(true).animate({ 'opacity': 1 }, 1000); // 첫번째 슬라이드만 보이게 하기
		function PrevSlide() { // 이전버튼 함수
			stopSlide(); startSlide(); //타이머 초기화
			var $lastSlide = $slider.find('li').last() //마지막 슬라이드
					.prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기
			$secondSlide = $slider.find('li').eq(1)//두 번째 슬라이드 구하기
					.stop(true).animate({ 'opacity': 0 }, 200); //밀려난 두 번째 슬라이드는 fadeOut 시키고
			$firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
					.stop(true).animate({ 'opacity': 1 }, 500);//새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
		}
		PrevSlide
		function NextSlide() { // 다음 버튼 함수
			stopSlide(); startSlide(); //타이머 초기화
			$firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
					.appendTo($slider); // 맨 마지막으로 보내기
			var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
					.stop(true).animate({ 'opacity': 0 }, 200); // fadeOut시키기
			$firstSlide = $slider.find('li').first()// 맨 처음 슬라이드
					.stop(true).animate({ 'opacity': 1 }, 500);// fadeIn 시키기
		}

		function next() {

			moveSlide(currentIdx + 1);
			NextSlide();
		}

		$('#next').on('click', function() { //다음버튼 클릭
			moveSlide(currentIdx + 1);
			NextSlide();
		});
		$('#prev').on('click', function() { //이전 버튼 클릭
			PrevSlide();
			moveSlide(currentIdx - 1);

		});
		startSlide(); // 자동 슬라이드 시작

		var theInterval;

		 function startSlide() {
			theInterval = setInterval(next, 40000000); //자동 슬라이드 설정
		} 

		function stopSlide() { //자동 멈추기
			clearInterval(theInterval);
		}

		$('.slider').hover(function() { //마우스 오버시 슬라이드 멈춤
			stopSlide();
		}, function() {
			startSlide();
		});

	});


	//네이버 지도 api
	var map = new naver.maps.Map('map', {
		center: new naver.maps.LatLng(35.1596175, 129.06022),
		zoom: 18
	});

	var map = new naver.maps.Map(document.getElementById('map'), {
		center: new naver.maps.LatLng(35.1596175, 129.06022),
		zoom: 18
	});
	//마커
	var marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(35.1596175, 129.06022),
		map: map
	});
</script>

<%--<c:choose>--%>
<%--	<c:when test="${pricipal!=null || principal.roleId==2}">--%>
<%-- <script type="text/javascript">
			$(document).ready(function() {
				Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
				Chart.defaults.global.defaultFontColor = '#292b2c';

				function drawChart(response) {
					let labels = [];
					let dataAdult = [];
					let dataYouth = [];
					let dataTotal = [];

					for (let i = 0; i < response.length; i++) {
						labels.push(response[i].title);
						let adultCount = parseInt(response[i].adultCount);
						let youthCount = parseInt(response[i].youthCount);
						dataAdult.push(adultCount);
						dataYouth.push(youthCount);
						dataTotal.push(adultCount + youthCount);
					}

					let ctx = document.getElementById("myBarChart").getContext("2d");
					let myBarChart = new Chart(ctx, {
						type: 'bar',
						data: {
							labels: labels,
							datasets: [
								{
									label: "성인",
									backgroundColor: "rgba(2,117,216,1)",
									borderColor: "rgba(2,117,216,1)",
									data: dataAdult,
								},
								{
									label: "청소년 수",
									backgroundColor: "rgba(255,193,7,1)",
									borderColor: "rgba(255,193,7,1)",
									data: dataYouth,
								},
								{
									label: "총 수",
									backgroundColor: "rgba(60,186,159,1)",
									borderColor: "rgba(60,186,159,1)",
									data: dataTotal,
								}
							],
						},
						options: {
							legend: {
								position: 'right'
							},
							scales: {
								x: {
									grid: {
										display: false
									}
								},
								y: {
									ticks: {
										beginAtZero: true,
									},
									grid: {
										display: true,
									}
								}
							},
							plugins: {
								title: {
									display: true,
									text: '공연별 방문자 현황',
									font: {
										size: 30
									},
								},
							},
							tooltips: {
								callbacks: {
									label: function(tooltipItem, data) {
										return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "명";
									}
								},
							},
						}
					});
				}


				// JSON 데이터를 가져오는 부분을 수정
				$.ajax({
					type: 'get',
					url: '/apiShowSale/manager/showSale',
					contentType: 'application/json; charset=utf-8',
				}).done(function(response) {
					drawChart(response.data);
				}).fail(function(error) {
					console.log(error);
					console.log("데이터를 불러오는 데 실패하였습니다.");
				});
			});

			document.addEventListener('DOMContentLoaded', function() {
				let calendarEl = document.getElementById('calendar');
				let calendar = new FullCalendar.Calendar(calendarEl, {
					locale : 'ko',
					timezone : "local",
					slotMinTime: '08:00', // Day 캘린더에서 시작 시간
					slotMaxTime: '25:00', // Day 캘린더에서 종료 시간
					initialView : 'timeGridWeek', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
					headerToolbar : { // 헤더에 표시할 툴 바
						start : 'prev next today',
						center : 'title',
						end : 'dayGridMonth,timeGridWeek,timeGridDay'
					},

					titleFormat : function(date) {
						return date.date.year + '년 '
								+ (parseInt(date.date.month) + 1) + '월';
					},
					/*             initialDate: '2023-05-04', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.) 나중엔 해제해야함 */
					navLinks: true,
					selectable : true, // 달력 일자 드래그 설정가능
					droppable : true,
					// editable : true,
					nowIndicator : true, // 현재 시간 마크
					allDay: true,
					locale : 'ko', // 한국어 설정
					events: [
						<c:forEach items="${lists}" var="list">
						<c:choose>
						<c:when test="${list.holeName == '오페라극장'}">
						<c:set var="backgroundColor" value="#FFE3D5" />
						<c:set var="borderColor" value="#FFE3D5" />
						</c:when>
						<c:when test="${list.holeName == '콘서트홀'}">
						<c:set var="backgroundColor" value="#8DC6ED" />
						<c:set var="borderColor" value="#8DC6ED" />
						</c:when>
						<c:when test="${list.holeName == '리사이틀홀'}">
						<c:set var="backgroundColor" value="#EAFCD4" />
						<c:set var="borderColor" value="#EAFCD4" />
						</c:when>
						<c:when test="${list.holeName == '반고흐관'}">
						<c:set var="backgroundColor" value="#FFF3D9" />
						<c:set var="borderColor" value="#FFF3D9" />
						</c:when>
						<c:when test="${list.holeName == '빈센트관'}">
						<c:set var="backgroundColor" value="#DAE5FB" />
						<c:set var="borderColor" value="#DAE5FB" />
						</c:when>
						<c:when test="${list.holeName == '다빈치관'}">
						<c:set var="backgroundColor" value="#895DAE" />
						<c:set var="borderColor" value="#895DAE" />
						</c:when>
						<c:when test="${list.holeName == '피카소관'}">
						<c:set var="backgroundColor" value="#FFA17E" />
						<c:set var="borderColor" value="#FFA17E" />
						</c:when>
						<c:when test="${list.holeName == '인문실'}">
						<c:set var="backgroundColor" value="#5CE390" />
						<c:set var="borderColor" value="#5CE390" />
						</c:when>
						<c:when test="${list.holeName == '과학실'}">
						<c:set var="backgroundColor" value="#94F7ED" />
						<c:set var="borderColor" value="#94F7ED" />
						</c:when>
						<c:when test="${list.holeName == '미술실'}">
						<c:set var="backgroundColor" value="#F4F4FE" />
						<c:set var="borderColor" value="#F4F4FE" />
						</c:when>
						<c:when test="${list.holeName == '어린이'}">
						<c:set var="backgroundColor" value="#DCF19A" />
						<c:set var="borderColor" value="#DCF19A" />
						</c:when>
						<c:otherwise>
						<c:set var="backgroundColor" value="" />
						<c:set var="borderColor" value="" />
						</c:otherwise>
						</c:choose>

						{
							id: '${list.id}',
							title: '${list.holeName} ${list.title}',
							start: '${list.startDate}T${list.startTime}',
							imageurl: '${list.imgRoute}',
							backgroundColor: '${backgroundColor}',
							borderColor: '${borderColor}',
							textColor: 'black'
						},
						{
							id: '아이디',
							title: '홀 이름 + 타이틀',
							start: '시작 일T$시작 시간',
							imageurl: '이미지 경로',
							backgroundColor: '${backgroundColor}',
							borderColor: '${borderColor}',
							textColor: 'black'
						},
						</c:forEach>
					],
					eventClick:function(event) {
						// 모달 창 열기
						let modal = document.getElementById('myModal');
						modal.style.display = 'block';
						let id = event.event.id;
						$.ajax({
							url: '/api/scheduleDetail/'+ id,
							type: "GET",
							contentType: 'application/json; charset=utf-8',
							dataType: 'json',
							success: function(data) {
								let event = data.data;
								$("#id").val(event.id),
										$("#title").text(event.title);
								$("#showDate").text(event.startDate);
								$("#showTime").text(event.showTime);
								$("#holeName").text(event.holeName);
								$("#images").attr("src", "/images/upload/" + event.imgRoute);
							}
						});
						// 모달 창 닫기 버튼 클릭 핸들러
						let closeBtn = modal.querySelector('.close');
						closeBtn.addEventListener('click', function() {
							// 모달 창 닫기
							modal.style.display = 'none';
						});
						let showViewBtn = modal.querySelector('.showView');
						showViewBtn.addEventListener('click',function(){
							location.href="/show/showView/" + id;
						});
					},
					eventDataTransform: function(eventData) {
						if (eventData.end) {
							eventData.end = moment(eventData.end).subtract(-1, 'day').format('YYYY-MM-DD');
						}
						return eventData;
					}
				});
				calendar.render();
			}); --%>
<!-- 		</script> -->
<%--	</c:when>--%>
<%--	<c:otherwise>--%>
<%-- <script type="text/javascript">
			document.addEventListener('DOMContentLoaded', function() {
				let calendarEl = document.getElementById('userCalendar');
				let calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
					headerToolbar : { // 헤더에 표시할 툴 바
						start : 'prev next',
						center : 'title',
						end : 'dayGridMonth'
					},
					titleFormat : function(date) {
						return date.date.year + '년 '
								+ (parseInt(date.date.month) + 1) + '월';
					},
					selectable : true, // 달력 일자 드래그 설정가능
					droppable : true,
					nowIndicator : true, // 현재 시간 마크
					allDay: true,
					locale : 'ko', // 한국어 설정
					events: [
						<c:forEach items="${lists}" var="list">
						<c:choose>
						<c:when test="${list.holeName == '오페라극장'}">
						<c:set var="backgroundColor" value="#FFE3D5" />
						<c:set var="borderColor" value="#FFE3D5" />
						</c:when>
						<c:when test="${list.holeName == '콘서트홀'}">
						<c:set var="backgroundColor" value="#8DC6ED" />
						<c:set var="borderColor" value="#8DC6ED" />
						</c:when>
						<c:when test="${list.holeName == '리사이트홀'}">
						<c:set var="backgroundColor" value="#EAFCD4" />
						<c:set var="borderColor" value="#EAFCD4" />
						</c:when>
						<c:when test="${list.holeName == '반고흐관'}">
						<c:set var="backgroundColor" value="#FFF3D9" />
						<c:set var="borderColor" value="#FFF3D9" />
						</c:when>
						<c:when test="${list.holeName == '빈센트관'}">
						<c:set var="backgroundColor" value="#DAE5FB" />
						<c:set var="borderColor" value="#DAE5FB" />
						</c:when>
						<c:when test="${list.holeName == '다빈치관'}">
						<c:set var="backgroundColor" value="#895DAE" />
						<c:set var="borderColor" value="#895DAE" />
						</c:when>
						<c:when test="${list.holeName == '피카소관'}">
						<c:set var="backgroundColor" value="#FFA17E" />
						<c:set var="borderColor" value="#FFA17E" />
						</c:when>
						<c:when test="${list.holeName == '인문실'}">
						<c:set var="backgroundColor" value="#E6E6FA" />
						<c:set var="borderColor" value="#E6E6FA" />
						</c:when>
						<c:when test="${list.holeName == '과학실'}">
						<c:set var="backgroundColor" value="#94F7ED" />
						<c:set var="borderColor" value="#94F7ED" />
						</c:when>
						<c:when test="${list.holeName == '미술실'}">
						<c:set var="backgroundColor" value="#F4F4FE" />
						<c:set var="borderColor" value="#F4F4FE" />
						</c:when>
						<c:when test="${list.holeName == '어린이'}">
						<c:set var="backgroundColor" value="#DCF19A" />
						<c:set var="borderColor" value="#DCF19A" />
						</c:when>
						<c:otherwise>
						<c:set var="backgroundColor" value="" />
						<c:set var="borderColor" value="" />
						</c:otherwise>
						</c:choose>

						{
							id: '${list.id}',
							title: '${list.holeName} ${list.title}',
							start: '${list.startDate}',
							end: '${list.endDate}',
							imageurl: '${list.imgRoute}',
							backgroundColor: '${backgroundColor}',
							borderColor: '${borderColor}',
							textColor: 'black'

						},
						</c:forEach>

						<c:forEach items="${categoryLists}" var="categoryList">
						<c:choose>
						<c:when test="${categoryList.holeName == '오페라극장'}">
						<c:set var="backgroundColor" value="#FFE3D5" />
						<c:set var="borderColor" value="#FFE3D5" />
						</c:when>
						<c:when test="${categoryList.holeName == '콘서트홀'}">
						<c:set var="backgroundColor" value="#8DC6ED" />
						<c:set var="borderColor" value="#8DC6ED" />
						</c:when>
						<c:when test="${categoryList.holeName == '리사이트홀'}">
						<c:set var="backgroundColor" value="#EAFCD4" />
						<c:set var="borderColor" value="#EAFCD4" />
						</c:when>
						<c:when test="${categoryList.holeName == '반고흐관'}">
						<c:set var="backgroundColor" value="#FFF3D9" />
						<c:set var="borderColor" value="#FFF3D9" />
						</c:when>
						<c:when test="${categoryList.holeName == '빈센트관'}">
						<c:set var="backgroundColor" value="#DAE5FB" />
						<c:set var="borderColor" value="#DAE5FB" />
						</c:when>
						<c:when test="${categoryList.holeName == '다빈치관'}">
						<c:set var="backgroundColor" value="#895DAE" />
						<c:set var="borderColor" value="#895DAE" />
						</c:when>
						<c:when test="${categoryList.holeName == '피카소관'}">
						<c:set var="backgroundColor" value="#FFA17E" />
						<c:set var="borderColor" value="#FFA17E" />
						</c:when>
						<c:when test="${categoryList.holeName == '인문실'}">
						<c:set var="backgroundColor" value="#E6E6FA" />
						<c:set var="borderColor" value="#E6E6FA" />
						</c:when>
						<c:when test="${categoryList.holeName == '과학실'}">
						<c:set var="backgroundColor" value="#94F7ED" />
						<c:set var="borderColor" value="#94F7ED" />
						</c:when>
						<c:when test="${categoryList.holeName == '미술실'}">
						<c:set var="backgroundColor" value="#F4F4FE" />
						<c:set var="borderColor" value="#F4F4FE" />
						</c:when>
						<c:when test="${categoryList.holeName == '어린이'}">
						<c:set var="backgroundColor" value="#DCF19A" />
						<c:set var="borderColor" value="#DCF19A" />
						</c:when>
						<c:otherwise>
						<c:set var="backgroundColor" value="" />
						<c:set var="borderColor" value="" />
						</c:otherwise>
						</c:choose>
						{
							id: '${categoryList.id}',
							title: '${categoryList.holeName} ${categoryList.title}',
							start: '${categoryList.startDate}',
							end: '${categoryList.endDate}',
							backgroundColor: '${backgroundColor}',
							borderColor: '${borderColor}',
							textColor: 'black'
						},
						</c:forEach>
					],
					eventClick:function(event) {
						// 모달 창 열기
						let modal = document.getElementById('myModal');
						modal.style.display = 'block';
						let id = event.event.id;
						$.ajax({
							url: '/api/scheduleDetail/'+ id,
							type: "GET",
							contentType: 'application/json; charset=utf-8',
							dataType: 'json',
							success: function(data) {
								let event = data.data;
								$("#id").val(event.id),
										$("#title").text(event.title);
								$("#startDate.startDate").text(event.startDate);
								$("#endDate.endDate").text(event.endDate);
								$("#holeName.holeName").text(event.holeName);
								$("#images").attr("src", "/images/upload/" + event.imgRoute);
							}
						});
						// 모달 창 닫기 버튼 클릭 핸들러
						let closeBtn = modal.querySelector('.close');
						closeBtn.addEventListener('click', function() {
							// 모달 창 닫기
							modal.style.display = 'none';
						});
						let showViewBtn = modal.querySelector('.showView');
						showViewBtn.addEventListener('click',function(){
							location.href="/show/showView/" + id;
						});
					},

					eventDataTransform: function(eventData) {
						if (eventData.end) {
							eventData.end = moment(eventData.end).subtract(-1, 'day').format('YYYY-MM-DD');
						}
						return eventData;
					}
				});
				calendar.render();

				let container = document.getElementById('map');
				let options = {
					center : new kakao.maps.LatLng(35.159573, 129.060249),
					level : 1
				};

				let map = new kakao.maps.Map(container, options);

				let markerPosition  = new kakao.maps.LatLng(35.159573, 129.060249);

				let marker = new kakao.maps.Marker({
					position: markerPosition

				});
				marker.setMap(map);
			});
		</script> --%>
<%--	</c:otherwise>--%>
<%--</c:choose>--%>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/information.js"></script>
<!-- --------------------------------------------------------- -->
<%@ include file="layout/footer.jsp"%>
