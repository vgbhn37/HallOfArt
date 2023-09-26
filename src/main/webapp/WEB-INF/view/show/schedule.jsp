<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>
	body{
		margin: 0; padding: 2px;
		background-color: #444;
	}
	.nav{
		background-color: #444;
		width: 100%;
		height: 100px;
	}
	.mid_menu{
 		background-color: white;
		width: 85%;
		height: 70px;
		margin: auto;
		padding: 0 40px;
		display: flex;
	}
	.mid1, .mid2, .mid3{
		height: 100%;
		text-align: center;
		border-right: 1px solid rgba(120,120,120,0.3);
	}
	.mid1{
		flex:0 0 70px;
		border-left: 1px solid rgba(120,120,120,0.3);
	}
	.mid2, .mid3{
		flex:0 0 220px;
	}
	.banner{
		width: 85%;
		height: 220px;
		margin: auto;
		padding: 0 40px;
		background-image: url("http://picsum.photos/2000/400");
	}
	
	.content{
		width: 85%;
		min-height: 800px;
		padding: 0 40px;
		margin: auto;
		background-color: white;
		box-shadow: inset 0px 5px 10px 0px rgba(128, 128, 128, 0.3);
		display: flex;
		overflow: hidden;
	}
	.content_date{
		flex: 0 0 400px;
		background-color: lightpink;
		text-align: center;
	}
	.content_list{
		flex: 0 0 500px;
		background-color: lightblue;
	}
	#list_tb{
		border: 1px solid grey;
		width: 480px;
		margin: auto;
		margin-top: 100px;
		text-align: center;
	}
	#list_tb td{
		height: 50px;
	}
</style>

<script>
function findByDateAjax(startDate, endDate){
	// ajax
   	$.ajax({
	    type : 'post',           // 타입 (get, post, put 등등)
	    url : '/show/schedule_proc',           // 요청할 서버url
	    dataType : 'text',       // 데이터 타입 (html, xml, json, text 등등)
	    data : {
	      "startDate" : startDate,
	      "endDate" : endDate
	    },
	    success : function(result) { // 결과 성공 콜백함수
	    	var data = JSON.parse(result);
	    	console.log(data);
	    	
	    	var table = $("#list_tb tbody");
	        
	    	table.empty();
	    	
	        $.each(data, function(index, item) {
	            // 각 데이터 항목에 대한 새로운 행을 생성합니다.
	            var row = $("<tr>");

	            // 각 데이터 항목에 대한 데이터 셀을 생성하고 값을 설정합니다.
	            var idCell = $("<td>").text(item.id);
	            var titleCell = $("<td>").append($("<a>").attr("href", "#").text(item.title));
	            var priceCell = $("<td>").text(item.price);
	            var startDateCell = $("<td>").text(item.startDate);
	            var endDateCell = $("<td>").text(item.endDate);
	            var statusCell = $("<td>").text(item.showStatus);

	            // 행에 데이터 셀을 추가합니다.
	            row.append(idCell);
	            row.append(titleCell);
	            row.append(priceCell);
	            row.append(startDateCell);
	            row.append(endDateCell);
	            row.append(statusCell);

	            // 테이블의 tbody에 행을 추가합니다.
	            table.append(row);
	        });
	    }
	})
}

$(function() {
	
	// 현재 날짜를 startDate, endDate 로 default 설정
	var currentDate = new Date();
	var year = currentDate.getFullYear();
	var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자릿수로 패딩
	var day = String(currentDate.getDate()).padStart(2, '0'); // 일을 두 자릿수로 패딩
	var formattedDate = year + '-' + month + '-' + day;

	console.log(formattedDate);
	
	$("#start_date").html(formattedDate);
   	$("#end_date").html(formattedDate);
	
   	var startDate = $("#start_date").html();
   	var endDate = $("#end_date").html();
    
   	findByDateAjax(startDate, endDate);
   	
   	// datepicker 설정
    $(".datepicker").datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
    });
    $('#datepicker1').datepicker('option', 'onSelect', function(dateString){
    	$("#start_date").html(dateString);
    	startDate = dateString;
    	$("#datepicker2").datepicker('option', 'minDate', dateString);
    });
    $('#datepicker2').datepicker('option', 'onSelect', function(dateString){
    	$("#end_date").html(dateString);
    	endDate = dateString;
    	$("#datepicker1").datepicker('option', 'maxDate', dateString);
    });
    $("#search").on("click", function(){
    	console.log("startDate : "+startDate+", endDate : "+endDate);
       	findByDateAjax(startDate, endDate);
    });
  });
</script>

</head>
<body>
	<div class="nav">
		<button type="button">메뉴</button>
		<button type="button">로그인</button>
		<button type="button">회원가입</button>
	</div>
	<div class="banner">
		
	</div>
	
	<div class="mid_menu">
		<div class="mid1">
			Home
		</div>
		<div class="mid2">
			{ 공연 / 전시 }
		</div>
		<div class="mid3">
			{ 상세 정보 }
		</div>
	</div>
	<div class="content">
		<div class="content_date">
			<input type="button" id="search" value="검색" ><br>
			최소 날짜 : <span id="start_date"></span><br>
			최대 날짜 : <span id="end_date"></span><br>
			<div class="datepicker" id="datepicker1"></div>
			<div class="datepicker" id="datepicker2"></div>
		</div>
		<div class="content_list">
			<table id="list_tb">
			<thead>
				<tr>
					<td width="30">id</td>
					<td style="width: 150px;">title</td>
					<td>price</td>
					<td>start date</td>
					<td>end date</td>
					<td>status</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>