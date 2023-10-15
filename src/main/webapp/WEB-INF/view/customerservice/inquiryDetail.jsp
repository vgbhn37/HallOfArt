<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/resources/css/inquiryDetail.css">

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
        <input id="subBtn" type="button" value="답변 작성" onclick="sendDetail()" />
        <input type="hidden" id="inquiryId" name="inquiryId" value="${inquiry.id}">
        <input type="hidden" id="page" name="page" value="${page}">
    </form>
</div>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/inquiryDetail.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>