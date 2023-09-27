<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<body>
	<h1>공지사항</h1>
		<table class="table">
		<thead>
			<tr>
				<th>분류</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="announcement" items="${announcementList}">
				<tr>
					<td><a href="#">${announcement.classification}</a></td>
					<td><a href="/customerservice/announcement/detail?page=${paging.page}&id=${announcement.id}">${announcement.title}</a></td>
					<td><a href="#">${announcement.createdAt}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	  <ul class="pagination">
    	<li class="page-item"><a class="page-link" href="/customerservice/announcement?page=<c:choose>
			<c:when test="${paging.page==1}">1</c:when>
			<c:otherwise>${paging.page-1}</c:otherwise>
			</c:choose>">Previous</a></li>
    	<c:forEach var="i" begin="1" end="${count}">
    	    <li class="page-item"><a class="page-link" href="/customerservice/announcement?page=${i}">${i}</a></li>
    	</c:forEach>
    	<li class="page-item"><a class="page-link" href="/customerservice/announcement?page=<c:choose>
			<c:when test="${paging.page==count}">${paging.page}</c:when>
			<c:otherwise>${paging.page+1}</c:otherwise>
			</c:choose>">Next</a></li>
 	</ul>
	<a href="/customerservice/announcement/write" class="btn btn-primary">글쓰기</a>
</body>
</html>