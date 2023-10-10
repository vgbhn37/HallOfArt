<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<body>
	<form action="/customerservice/inquiry/modify" method="post">
		<div class="mb-3">
		  <label for="title" class="form-label">title</label>
		  <input type="text" class="form-control" id="title" name="title" value="${inquiry.title}">
		</div>
		<div class="mb-3">
		  <label for="classification" class="form-label">classification</label>
		  <input type="text" class="form-control" id="classification" name="classification" value="${inquiry.classification}">
		</div>
		<div class="mb-3">
		  <label for="content" class="form-label">content</label>
		  <textarea class="form-control" id="content" rows="8" name="content" >${inquiry.content}</textarea>
		</div>
		<input type="hidden" name="id" id="id" value="${inquiry.id}">
		<input type="hidden" name="page" value="${page}">
		<button type="submit" class="btn btn-primary">수정하기</button>
	</form>
</body>
</html>