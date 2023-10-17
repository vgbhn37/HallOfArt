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