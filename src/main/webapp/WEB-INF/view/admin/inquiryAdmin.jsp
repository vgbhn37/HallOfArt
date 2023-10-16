<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HallOfArt</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="/css/admin_styles.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<link rel="stylesheet" href="/resources/css/announcementWrite.css">
</head>
<link rel="stylesheet" href="/resources/css/inquiryAdmin.css">

<body>
<!-- body  -->
<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4" style="width:90%">
	<h1 class = "title--announcement">문의</h1>
	
	<ul class = tab--announcement>
	    <li class="active" data-classification="전체"><a href="#">전체</a></li>
	    <li data-classification="미답변"><a href="#">미답변</a></li>
	</ul>
	
	<table class="table">
		<tbody id="announcement-list-container">
		</tbody>
	</table>
	<div class="paging">
		<form action="<c:url value='/customerservice/inquiry/admin/main'/>"
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
	<c:if test="${user.roleTypeId == 2}">
	<a href="/customerservice/announcement/write" class="write-btn">글쓰기</a>
</c:if>
</div>
</main>
</div>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/inquiryAdmin.js"></script>
</body>
</html>