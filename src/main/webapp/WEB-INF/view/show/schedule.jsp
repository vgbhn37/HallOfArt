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
/* 		background-color: lightpink; */
		text-align: center;
		margin: auto;
	}
	.content_list{
		flex: 0 0 500px;
		min-height: 800px;
/* 		background-color: lightblue; */
		margin: auto;
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
	.footer{
		background-color: #999;
		width: 100%;
		height: 180px;
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
<<<<<<< HEAD
	            var titleCell = $("<td>").append($("<a>").attr("href", "detail?id="+item.id).text(item.title));
=======
	            var titleCell = $("<td>").append($("<a>").attr("href", "#").text(item.title));
>>>>>>> eadd2e2d323580e4cc646bd6e11aaeff64027280
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

$(function() { // jquery
	
	// 현재 날짜를 startDate, endDate 로 default 설정 -----------------------------------------------------------
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
   	
   	// datepicker 설정 --------------------------------------------------------------
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
	   	findByDateAjax(startDate, endDate);
    });
    $('#datepicker2').datepicker('option', 'onSelect', function(dateString){
    	$("#end_date").html(dateString);
    	endDate = dateString;
    	$("#datepicker1").datepicker('option', 'maxDate', dateString);
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
<%@ include file="/WEB-INF/view/layout/mid_menu.jsp"%>
	
	<div class="content">
		<div class="content_date">
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
				<!-- jquery - ajax -> 데이터 들어옴 -->
			</tbody>
			</table>
		</div>
	</div>
	
	<div class="footer">
		footer
	</div>
</body>
</html>