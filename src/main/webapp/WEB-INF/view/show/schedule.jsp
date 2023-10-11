<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
<style>
	.schedule_content{
		margin: 20px auto;
		text-align: center;
	}
	.list_tb{
		width: 900px;
		margin: 20px auto;
		text-align: center;
	}
	.list_tb td{
		border-bottom : 1px solid lightgrey;
	}
	.pagination{
		justify-content: center;
	}
</style>
<!-- --------------------------------------------------------- -->
<div class="schedule_content">
	<h2>일정 검색</h2>

	날짜 선택 : 
	<input type="text" class="datepicker" id="datepicker">
	<button type="button" id="dateSearchBtn">검색</button>

	<table class="list_tb">
		<tr style="height: 50px">
			<td colspan="2" style="width: 50%">제목</td>
			<td style="width: 10%">입장가격</td>
			<td style="width: 30%">기간</td>
			<td style="width: 10%">상태</td>
		</tr>
		<c:forEach var="li" items="${list}">
			<tr>
				<td style="width: 20%">
					<img src="/imagePath/${li.showImg}" style="width: 150px; height: 150px; margin: 20px;">
				</td>
				<td style="width:30%"><a href="detail?id=${li.id}">${li.title}</a></td>
				<td><fmt:formatNumber value="${li.price}" pattern="#,###"/></td>
				<td>${li.startDate} ~ ${li.endDate}</td>
				<td>${li.showStatus}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="paging">
		<form action="showList" name="pageForm">
			<div class="text-center clearfix">
				<ul class="pagination" id="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item "><a class="page-link" href="#"
							data-page="${pagination.beginPage-1}">Prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pagination.beginPage}"
						end="${pagination.endPage}">
						<li class="${pagination.paging.page == num ? 'age-item active' : ''}"
							page-item><a class="page-link" href="#" data-page="${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							data-page="${pagination.endPage+1}">Next</a></li>
					</c:if>
				</ul>

				<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
				<input type="hidden" name="page" value="${pagination.paging.page}">
				<input type="hidden" name="recordSize"
					value="${pagination.paging.recordSize}">

			</div>
		</form>
	</div>
</div>


<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	// -------------------------- jquery
	$(document).ready(function(){
		$("#dateSearchBtn").on("click", function(){
			let pattern = /^\d{4}-\d{2}-\d{2}$/;
			if($("#datepicker").val().length==0){
				alert("날짜를 입력해주세요");
			}else if(!pattern.test($("#datepicker").val())){
				alert("시작 날짜의 형식이 맞지 않습니다 (yyyy-mm-dd)\n");
			}else{
				location.href="schedule?date="+$("#datepicker").val();
			}
		});
		// ----------------------- datepicker
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
	    
		// ----------------------- 반응형 웹 적용
	    $(window).resize(function() {
	        // 현재 윈도우의 너비를 가져옴
	        var windowWidth = $(window).width();

	        if (windowWidth <= 1000) {
	            $(".list_tb").css("width", "90%");
	        } else {
	            $(".list_tb").css("width", "900px");
	        }
	    });
	    $(window).trigger("resize");
	})
</script>
<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp" %>