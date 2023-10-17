<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/resources/css/announcementModify.css">

<!-- body  -->
<div class= "container" style="margin-top: 70px;">
	<h1 class="title--write">공지 작성</h1>
	
    <form method="post" action="/customerservice/announcement/modify" id="form" onsubmit="return false;">
        <div style="display: flex;">
            <input type="text" id="title" name="title" style="width: 94%;" placeholder="제목" value="${announcement.title}"/>
            <div class="dropdown" style="margin-left: 10px;">
                <button class="dropdown-btn" type="button">분류</button>
                <div class="dropdown-content">
                    <a onclick="selectItem('대관')">대관</a>
                    <a onclick="selectItem('전시')">전시</a>
                    <a onclick="selectItem('예매')">예매</a>
                    <a onclick="selectItem('회원')">회원</a>
                </div>
            </div>
        </div>
        <br>
        <br>
        <textarea id="summernote" id="content" name="content">${announcement.content}</textarea>
        <input id="subBtn" type="button" value="글 수정" onclick="send()" />
        <input type="hidden" id="classification" name="classification" />
        <input type="hidden" name="id" id="id" value="${announcement.id}">
		<input type="hidden" name="page" value="${page}">
    </form>
</div>

<script type="text/javascript" src="/resources/js/common.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>