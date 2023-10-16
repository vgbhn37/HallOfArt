<%@page import="com.silver.hallofart.repository.model.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@	include file="../layout/header.jsp"%>

<!-- --------------------------------------------------------- -->
<link href="/resources/css/showSchedule.css" rel="stylesheet" />
<style>
.schedule_content {
	margin: 20px auto;
	text-align: center;
}

.list_tb {
	width: 900px;
	margin: 20px auto;
	text-align: center;
}

.list_tb td {
	border-bottom: 1px solid lightgrey;
}

.pagination {
	justify-content: center;
}
</style>
<!-- --------------------------------------------------------- -->

<div class="schedule_content">
	<h2>공연 정보</h2>
	<br>
	날짜 선택 :
	<input type="text" class="datepicker" id="datepicker">
	<button type="button" id="dateSearchBtn">검색</button>
	<table class="list_tb">
		<tr style="height: 50px">
			<td colspan="2" style="width: 50%">제목</td>
			<td style="width: 10%">입장가격</td>
			<td style="width: 40%">기간</td>
		</tr>
		<c:forEach var="li" items="${list}">
			<tr>
				<td style="width: 20%">
					<img src="/imagePath/${li.showImg}" onerror="this.src='/resources/images/errorImage.png'" style="width: 150px; height: 200px; margin: 20px;">
				</td>
				<td style="width: 30%">
					<a href="detail?id=${li.id}">${li.title}</a>
				</td>
				<td>
					<fmt:formatNumber value="${li.price}" pattern="#,###" />
				</td>
				<td>${li.startDate}~${li.endDate}</td>
				<td>
					<c:set var="currentDate" value="<%=new java.util.Date()%>" />
					<c:set var="currentDateFormatted">
						<fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd" />
					</c:set>

					<fmt:parseDate value="${li.startDate }" var="startDate" pattern="yyyy-MM-dd" />
					<fmt:parseDate value="${li.endDate }" var="endDate" pattern="yyyy-MM-dd" />
					<c:set var="startDateFormatted">
						<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
					</c:set>
					<c:set var="endDateFormatted">
						<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
					</c:set>
					
					<c:choose>
						<c:when test="${startDateFormatted > currentDateFormatted}">
                        공연 전
                    </c:when>
						<c:when test="${endDateFormatted < currentDateFormatted}">
                        공연 종료
                    </c:when>
						<c:otherwise>
                        공연 중
                    </c:otherwise>
					</c:choose>
				</td>
				<td style="width:30%"><a href="detail?id=${li.id}">${li.title}</a></td>
				<td><fmt:formatNumber value="${li.price}" pattern="#,###"/></td>
				<td>${li.startDate} ~ ${li.endDate}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="paging">
		<form action="showList" name="pageForm">
			<div class="text-center clearfix">
				<ul class="pagination" id="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item "><a class="page-link" href="#" data-page="${pagination.beginPage-1}">Prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pagination.beginPage}" end="${pagination.endPage}">
						<li class="${pagination.paging.page == num ? 'age-item active' : ''}" page-item><a class="page-link" href="#" data-page="${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#" data-page="${pagination.endPage+1}">Next</a></li>
					</c:if>
				</ul>

				<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
				<input type="hidden" name="page" value="${pagination.paging.page}">
				<input type="hidden" name="recordSize" value="${pagination.paging.recordSize}">

			</div>
		</form>
	</div>
</div>


<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/js/showSchedule.js"></script>
<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp"%>