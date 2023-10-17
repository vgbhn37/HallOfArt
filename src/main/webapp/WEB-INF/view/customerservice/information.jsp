<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cw4qth9oev"></script>
<link rel="stylesheet" href="/resources/css/information.css">

<!-- body -->
<div class="container">
	<h1 class="title--way">오시는길</h1>
	<div class="way">
		<div style="width: 5%"></div>
		<div id="map"></div>
		<div style="width: 10%"></div>
		<div class="way--c">
			<div class="way--r" style="margin-bottom: 15px;">
				<strong class="t--address">도로명</strong>
				<span class="d--address">부산 부산진구 중앙대로 749</span>
			</div>
			<div class="way--r" style="margin-bottom: 15px;">
				<strong class="t--address">지번</strong>
				<span class="d--address" style="margin-left: 36px;">부전동 266-2 (우 47254)</span>
			</div>
			<div class="way--r">
				<strong class="t--address">건물명</strong>
				<span class="d--address">혜도빌딩 4층</span>
			</div>
		</div>
	</div>
	
	<h1 class="title--way" style="margin-top: 80px">대중교통 이용안내</h1>
	<p class="s--t">지하철</p>
	<div class="subway">
		<div style="width:5%"></div>
		<div class="l--subway">
			<span style="margin-bottom: 20px; color: #ff8d8d;">• 1호선</span>
			<span style="color: #37b42d">• 2호선</span>
		</div>
		<div style="width:20%"></div>
		<span class="d--subway">서면역 15번 출구로 나와 5~10분 도보이동</span>
	</div>
	<p class="s--t" style="margin-top: 30px;">버스</p>
	<div class="subway" style="margin-bottom: 50px;">
		<div style="width:5%"></div>
		<div class="l--subway">
			<span style="margin-bottom: 20px; color: #ff8d8d;">• 부전시장 정류장 <br> 10, 1010, 111, 33, 43, 5-1, 62, 80, 87</span>
			<span style="color: #37b42d">• 서면역 12번출구 정류장 <br> 110-1, 17, 52, 68</span>
		</div>
		<div style="width:20%"></div>
		<span class="d--subway">각 정류장 하차후 5~10분 도보이동</span>
	</div>
</div>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/information.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>