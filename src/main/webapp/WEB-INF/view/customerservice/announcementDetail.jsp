<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<link rel="stylesheet" href="/resources/css/announcementDetail.css">

<!-- body  -->
<div class= "container" style="margin-top: 70px; width:80%">
	<h1 class="title--detail">공지 사항</h1>
	<!-- 제목 카테고리  -->
	<div class="title--box">
		<p class="">${announcement.title}</p>
		<p class="classification">${announcement.classification}</p>
	</div>
	<!-- 작성일 -->
	<p class="createdAt">${announcement.createdAt}</p>
	<!-- 내용 -->
	<div class="content">
		<p>${announcement.content}</p>
	</div>
	<!-- 하단버튼  -->
	<div class="detail--footer">
		<a href="/customerservice/announcement?page=${page}" id="listBtn">목록</a>
		<c:if test="${user.roleTypeId == 2}">
			<a
				href="/customerservice/announcement/modify?id=${announcement.id}&page=${page}" id="modifyBtn">수정하기</a>
			<a
				href="/customerservice/announcement/delete?id=${announcement.id}" id="deleteBtn">삭제</a>
		</c:if>
	</div>
	
</div>
<script type="text/javascript" src="/resources/js/common.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>