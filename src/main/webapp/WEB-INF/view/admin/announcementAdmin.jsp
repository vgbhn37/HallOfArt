<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
<link rel="stylesheet" href="/resources/css/announcementWrite.css">

<!-- body  -->
<body>
<div id="layoutSidenav_content">
<main>
<div class= "container-fluid px-4" style="margin-top: 50px; margin-left: 0px;">
	<h1 class="title--write">공지 작성</h1>
	
    <form method="post" action="/customerservice/announcement/write" id="form" onsubmit="return false;">
        <div style="display: flex;">
            <input type="text" id="title" name="title" style="width: 94%;" placeholder="제목" />
            <div class="dropdown" style="margin-left: 10px;">
                <button class="dropdown-btn" type="button">분류</button>
                <div class="dropdown-content">
                    <a onclick="selectItem('대관')">대관</a>
                    <a onclick="selectItem('전시')">전시</a>
                    <a onclick="selectItem('회원')">회원</a>
                    <a onclick="selectItem('결제')">결제</a>
                </div>
            </div>
        </div>
        <br>
        <br>
        <textarea id="summernote" id="content" name="content"></textarea>
        <input id="subBtn" type="button" value="글 작성" style="float: left;" onclick="send()" />
        <input type="hidden" id="classification" name="classification" />
    </form>
</div>
</main>
</div>
<script type="text/javascript" src="/resources/js/common.js"></script>
</body>
</html>
