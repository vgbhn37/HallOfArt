<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cw4qth9oev"></script>
	<h1>오시는길</h1>
	<div id="map" style="width:100%; height:800px;">
		
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
	</div>

</body>
</html>