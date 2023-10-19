<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/announcement.css">

<!-- body  -->
<div class="container">
	<h1 class = "title--announcement">공지사항</h1>
	
	<ul class = tab--announcement>
	    <li class="active" data-classification="전체"><a href="#">전체</a></li>
	    <li data-classification="대관"><a href="#">대관</a></li>
	    <li data-classification="공연"><a href="#">공연</a></li>
	    <li data-classification="예매"><a href="#">예매</a></li>
	    <li data-classification="회원"><a href="#">회원</a></li>
	</ul>
	
	<table class="table">
		<tbody id="announcement-list-container">
		</tbody>
	</table>
	<div class="paging">
		<form action="<c:url value='/customerservice/announcement'/>"
			name="pageForm">
			<div class="text-center clearfix">
				<ul class="pagination" id="pagination--a">
					<c:if test="${pagination.prev}">
						<li class="page-item "><a class="page-list" href="#"
							data-page="${pagination.beginPage-1}">Prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pagination.beginPage}"
						end="${pagination.endPage}">
						<li
							class="${pagination.paging.page == num ? 'age-item active' : ''} page-item"
							><a class="page-list" href="#" data-page="${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-list" href="#"
							data-page="${pagination.endPage+1}">Next</a></li>
					</c:if>
				</ul>

				<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
				<input type="hidden" id="page" name="page" value="${pagination.paging.page}">
				<input type="hidden" name="recordSize"
					value="${pagination.paging.recordSize}">

			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/announcement.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>