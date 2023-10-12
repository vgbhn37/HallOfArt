<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cw4qth9oev"></script>
<style>
.title--way {
    position: relative;
    color: #535353;
    font-size: 35px;
    line-height: 35px;
    padding: 5px 0 20px 22px;
    margin-bottom: 35px;
    border-bottom: 1px solid #535353;
}

.title--way:before {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 12px;
    height: 12px;
    background: #ed1a3b;
    content: "";
}
.container {
	margin-top: 40px;
}
.way{
	background: #f9f6f6;
	height:400px;
    display: flex;
    align-items: center;
}
#map{
	margin: 0;
	width:50%;
	height:300px;
	border: 1px solid #ddd;
}
.way--r{
	position: relative;
	padding-left: 8px;
/* 	display: table-cell; */
    vertical-align: top;
}
.t--address {
    width: 108px;
    font-size: 16px;
    font-weight: bold;
    color: #2442b1;
    line-height: 24px;
    white-space: nowrap;
    padding-right: 4px;
}
.t--address:after {
	content: '';
    width: 1px;
    height: 18px;
    background: #2442b1;
    position: absolute;
    left: 0;
    top: 4px;
}
.d--address {
	font-size: 16px;
    line-height: 24px;
    margin-left: 20px;
}
.subway {
    display: flex;
    align-items: center;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}

.l--subway {
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin: 15px;
    width: 20%
}
.l--subway span {
	font-weight: bold;
    margin-bottom: 16px;
    font-size: 16px;
    line-height: 34px;
}
.d--subway {
	width: 50%;
	color: #3171d3;
	font-weight: bold;
    margin-bottom: 16px;
    font-size: 16px;
    line-height: 34px;
}
.s--t {
    padding-top: 10px;
    position: relative;
    font-size: 20px;
    color: #333333;
    font-weight: 500;
}
.s--t:after {
	content: "";
    display: block;
    height: 7px;
    width: 30px;
    background: #ed1839;
    position: absolute;
    top: 0;
    left: 0;
}
</style>
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

<script>
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
<%@include file="/WEB-INF/view/layout/footer.jsp"%>