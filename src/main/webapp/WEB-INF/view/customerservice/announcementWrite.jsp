<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<body>
	<form action="/customerservice/announcement/write" method="post" onsubmit="return false;" id="form">
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
		<button type="button" class="btn btn-primary" onclick="send()">글쓰기</button>
	</form>
	
	<script>
		function validationForm(){
		    let form = document.querySelector("#form");
		    let title = form.elements["title"].value;
		    let classification = form.elements["classification"].value;
		    let content = form.elements["content"].value;
	
		    if(!title) {
		        alert("제목을 입력하세요.");
		        return false;
		    }
		    if(!classification) {
		        alert("분류값을 입력하세요.");
		        return false;
		    }
		    if(!content) {
		        alert("내용을 입력하세요.");
		        return false;
		    }
	
		    return true;
		}
	
		function send() {
		    if(validationForm()) {
		        document.querySelector("#form").submit();
		    }
		}
	</script>
</body>
</html>