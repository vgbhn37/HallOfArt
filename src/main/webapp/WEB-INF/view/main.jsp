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

.body--content--main {
	background-color: #fff;
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
	left: 200px;
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
	/* 	border: 1px solid #f7ede4; */
	/* 	margin: 50px; */
	margin-top: -60px;
	margin-top: -60px;
	background-color: #F7F8E0;
	margin-left: -500px;
	color: #000;
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

.hidden {
	display: none;
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

/* 지도 */
.way {
	background: #f9f6f6;
	width: 400px;
	height: 400px;
	display: flex;
	align-items: center;
}
</style>
<!-- slider  -->
<div style="width: 100%; height: 220px; background-color: #F7F8E0; margin-top: -220px;"></div>
<div class="main--content--div" style="height: 100%; width: 100%">
	<div class="content--box">
		<div class="content">
			<ul class="slider">
				<c:forEach var="showList" items="${showsList}">
					<li>
						<div class="content--info">
							<dl style="margin-top: -10px; height: 230%;" class="right">
								<div class="info">
									<p style="margin-top: 60px; margin-left: -330px; background-color: #fff; border: 1px solid #fff; border-radius: 20px; font-size: 20px; font-weight: 400; padding: 5px 20px;">${showList.showType }</p>
									<h2 style="margin-top: 10px; margin-left: -330px; font-size: 35px; font-weight: 200; margin-bottom: 20px;">🔔️ ${showList.hallName }</h2>
									<h4 style="margin-top: 5px; margin-left: -330px; font-size: 25px; font-weight: 100;">기간 : ${showList.startDate} &nbsp&nbsp&nbsp~&nbsp&nbsp&nbsp ${showList.endDate}</h4>
									<h1 style="display: flex; align-items: center; margin-top: 10px; margin-bottom: -180px; margin-left: -330px; font-size: 57px; font-weight: 200; height: 100px;">${showList.title }</h1>
									<img style="margin-top: -65px; width: 480px; height: 600px; min-height: 600px;" src="/imagePath/${showList.showImg}" onerror="this.src='/resources/images/errorImage.png'"
										onclick="location.href='/show/detail?id=${showList.id}'"
									>
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
	</div>
	<!-- end of slider -->

</div>
<!-- 공지사항 + 찾아오시는 길  -->
<div class="row" style="width: 100%;">
	<!-- 공지사항  -->
	<div style="width: 40%; margin-left: 80px; margin-bottom: 50px;">
		<h1 class="title--inquiry" style="margin-top: 120px;">공지사항</h1>
		<table class="table">
			<tbody id="inquiry-list-container">
				<c:forEach var="announcement" items="${announcementList}">
					<tr>
						<td>
							<a href="/customerservice/announcement/detail?page=1&id=${announcement.id}">${announcement.title}</a>
						</td>
						<td>
							<a href="#">
								<fmt:formatDate value="${announcement.createdAt}" pattern="yyyy-MM-dd" />
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="width: 7%"></div>
	<!-- 오시는길  -->
	<div style="width: 40%; margin-right: 80px; margin-bottom: 50px;">
		<h1 class="title--way" style="margin-top: 120px !important;">오시는길</h1>
		<div class="way" style="width: 100%; height: 350px;">
			<div style="width: 5%;"></div>
			<div id="map" style="width: 90%; height: 300px;"></div>
		</div>
	</div>
</div>
<!-- end of announce, info -->


<script>
	// 중복 클릭 방지
	$(".button").on("click", function() {
		$(this).attr("disabled", true);
		setTimeout(function() {
			$(".button").attr("disabled", false);
		}, 550);
	});

	// 이미지 흘러가기 기능 구현
	var slides = document.querySelector('.slides'), slide = document
			.querySelectorAll('.slides li'),

	currentIdx = 0, slideCount = $('.slides li').length, slideWidth = 150, slideMargin = 30, prevBtn = document
			.querySelector('.prev'), nextBtn = document.querySelector('.next');
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

		var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin
				+ 'px';
		slides.style.width = newWidth;
	}
	function setInitialPos() {
		var initialTranslateValue = -(slideWidth + slideMargin) * slideCount;
		slides.style.transform = 'translateX(' + initialTranslateValue + 'px)';
	}

	function moveSlide(num) {
		slides.style.left = -num * (slideWidth + slideMargin) + 'px';
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
		var $slider = $('.slider'), $firstSlide = $slider.find('li').first() // 첫번째 슬라이드
		.stop(true).animate({
			'opacity' : 1
		}, 1000); // 첫번째 슬라이드만 보이게 하기
		function PrevSlide() { // 이전버튼 함수
			stopSlide();
			startSlide(); //타이머 초기화
			var $lastSlide = $slider.find('li').last() //마지막 슬라이드
			.prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기
			$secondSlide = $slider.find('li').eq(1)//두 번째 슬라이드 구하기
			.stop(true).animate({
				'opacity' : 0
			}, 200); //밀려난 두 번째 슬라이드는 fadeOut 시키고
			$firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
			.stop(true).animate({
				'opacity' : 1
			}, 500);//새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
		}
		//PrevSlide
		function NextSlide() { // 다음 버튼 함수
			stopSlide();
			startSlide(); //타이머 초기화
			$firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
			.appendTo($slider); // 맨 마지막으로 보내기
			var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
			.stop(true).animate({
				'opacity' : 0
			}, 200); // fadeOut시키기
			$firstSlide = $slider.find('li').first()// 맨 처음 슬라이드
			.stop(true).animate({
				'opacity' : 1
			}, 500);// fadeIn 시키기
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
			theInterval = setInterval(next, 5000); //자동 슬라이드 설정
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
		center : new naver.maps.LatLng(35.1596175, 129.06022),
		zoom : 18
	});

	var map = new naver.maps.Map(document.getElementById('map'), {
		center : new naver.maps.LatLng(35.1596175, 129.06022),
		zoom : 18
	});
	//마커
	var marker = new naver.maps.Marker({
		position : new naver.maps.LatLng(35.1596175, 129.06022),
		map : map
	});
</script>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/information.js"></script>
<!-- --------------------------------------------------------- -->
<%@ include file="layout/footer.jsp"%>
