<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
    .title--detail {
	    padding-top: 10px;
	    position: relative;
	    font-size: 25px;
	    color: #333333;
	    font-weight: 540;
	}
	.title--detail:after {
		content: "";
	    display: block;
	    height: 7px;
	    width: 20px;
	    background: #ed1839;
	    position: absolute;
	    top: 0;
	    left: 0;
	}
	.title--box {
		text-align: center;
    	padding-bottom: 50px;
    	border-bottom: 1px solid #000;
    	margin-top: 60px;
	}
	
	.title--box p {
		font-size:25px;
		font-weight: bold;
		margin-bottom: 30px;
	}
	
	.classification {
		border: 1px solid #ed1a3b;
	    color: #ed1a3b;
	    display: inline-block;
	    padding: 8px 10px;
	    font-size: 15px !important;
	}
	.createdAt {
		text-align: right;
		font-size: 15px;
		padding: 10px;
	}
	.content {
		margin-top: 40px;
		font-size: 15px;
		border-bottom: 1px solid #000;
		padding-bottom: 40px;
	}
	.detail--footer{
		margin-top : 40px;
		padding-bottom : 40px;
	}
	#listBtn {
		display: inline-block;
	    padding: 10px 20px;
		border: 1px solid black;
	    background-color: #fff;
	    color: #151432;
	    margin-bottom: 50px;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	    font-weight: bold;
	}
	
	#listBtn:hover {
	    background-color: #151432;
    	color: #fff;
	}
	#modifyBtn {
		display: inline-block;
	    padding: 10px 20px;
		border: 1px solid grey;
	    background-color: #fff;
	    color: grey;
	    margin-bottom: 50px;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	    font-weight: bold;
	}
	
	#modifyBtn:hover {
	    background-color: grey;
    	color: #fff;
	}
	#deleteBtn {
		display: inline-block;
	    padding: 10px 20px;
		border: 1px solid red;
	    background-color: #fff;
	    color: red;
	    margin-bottom: 50px;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	    font-weight: bold;
	}
	
	#deleteBtn:hover {
	    background-color: red;
    	color: #fff;
	}
	
	#subBtn {
		margin-top: 40px;
		display: inline-block;
	    padding: 10px 20px;
		border: 1px solid black;
	    background-color: #fff;
	    color: #151432;
	    margin-bottom: 50px;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	    font-weight: bold;
	}
	
	#subBtn:hover {
	    background-color: #151432;
    	color: #fff;
	}
	
	#answerBtn {
		margin-top: 40px;
		display: inline-block;
	    padding: 10px 20px;
		border: 1px solid #B0C4DE;
	    background-color: #fff;
	    color: #B0C4DE;
	    margin-bottom: 50px;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	    font-weight: bold;
	}
	
	#answerBtn:hover {
	    background-color: #B0C4DE;
    	color: #fff;
	}
</style>

<!-- 문의내용  -->
<div class= "container" style="margin-top: 70px; width:80%">
	<h1 class="title--detail">문의내용</h1>
	<!-- 제목 카테고리  -->
	<div class="title--box">
		<p class="">${inquiry.title}</p>
		<p class="classification">${inquiry.classification}</p>
	</div>
	<!-- 작성일 -->
	<p class="createdAt">${inquiry.createdAt}</p>
	<!-- 내용 -->
	<div class="content">
		<p>${inquiry.content}</p>
	</div>
	<!-- 하단버튼  -->
	<div class="detail--footer">
		<a href="/customerservice/inquiry?page=${page}" id="listBtn">목록</a>
		<c:if test="${user.id == inquiry.userId}">
			<c:if test="${inquiry.answer == 0}">
				<a href="/customerservice/inquiry/modify?id=${inquiry.id}&page=${page}" id="modifyBtn">수정하기</a>
			</c:if>
			<a
				href="/customerservice/inquiry/delete?id=${inquiry.id}" id="deleteBtn">삭제</a>
		</c:if>
		<c:if test="${user.roleTypeId == 2 && inquiry.answer == 0}">
			<a href="#" id="answerBtn">답변하기</a>
		</c:if>
	</div>
	
</div>

<!-- 답변내용  -->

<c:if test="${inquiry.answer == 1}">
<div class= "container" style="margin-top: 70px; width:80%">
	<h1 class="title--detail">답변 내용</h1>
	<!-- 제목 카테고리  -->
	<div class="title--box">
		<p class="">${answer.title}</p>
	</div>
	<!-- 작성일 -->
	<p class="createdAt">${answer.createdAt}</p>
	<!-- 내용 -->
	<div class="content">
		<p>${answer.content}</p>
	</div>
	<!-- 하단버튼  -->
	<div class="detail--footer">
		<c:if test="${user.roleTypeId == 2}">
			<a href="/customerservice/inquiry/answerDelete?id=${inquiry.id}&page=${page}" id="deleteBtn">삭제</a>
		</c:if>
	</div>
	
</div>
</c:if>

<!-- 답변하기  -->
<div class= "container" style="margin-top: 70px; margin-bottom: 100px; display:none; width:80%" id="answerForm">
	<h1 class="title--detail" style="margin-bottom: 40px !important;">답변 작성</h1>
	
    <form method="post" action="/customerservice/inquiry/answer" id="aForm" onsubmit="return false;">
        <div style="display: flex;">
            <input type="text" id="title" name="title" style="width: 100%;" placeholder="제목" />
        </div>
        <br>
        <br>
        <textarea id="summernote" id="content" name="content"></textarea>
        <input id="subBtn" type="button" value="답변 작성" onclick="send()" />
        <input type="hidden" id="inquiryId" name="inquiryId" value="${inquiry.id}"> 
        <input type="hidden" id="page" name="page" value="${page}">
    </form>
</div>

<script>
	//답변하기 버튼 클릭시 답변작성 폼 활성화
	document.querySelector("#answerBtn").addEventListener("click", function() {
		let answerForm = document.querySelector("#answerForm")
		answerForm.style.display = "";
	})
	
	//답변 유효성 검사
	function validationForm() {
		let form = document.querySelector("#aForm");
		let title = form.elements["title"].value;
		let content = form.elements["content"].value;

		if (!title) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!content) {
			alert("내용을 입력하세요.");
			return false;
		}

		return true;
	}

	function send() {
		if (validationForm()) {
			document.querySelector("#aForm").submit();
		}
	}
	
	//summernote
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});
</script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>