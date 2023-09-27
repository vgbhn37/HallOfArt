<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<body>
	<form action="/customerservice/announcement/write" method="post">
		<div class="mb-3">
		  <label for="title" class="form-label">title</label>
		  <input type="text" class="form-control" id="title" name="title">
		</div>
		<div class="mb-3">
		  <label for="classification" class="form-label">classification</label>
		  <input type="text" class="form-control" id="classification" name="classification">
		</div>
		<div class="mb-3">
		  <label for="content" class="form-label">content</label>
		  <textarea class="form-control" id="content" rows="8" name="content"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">글쓰기</button>
	</form>
</body>
</html>