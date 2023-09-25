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
					<td><a href="#">${announcement.title}</a></td>
					<td><a href="#">${announcement.createdAt}</a></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</body>
</html>