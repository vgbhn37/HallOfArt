<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/resources/css/inquiryModify.css">

<!-- body  -->
<div class= "container" style="margin-top: 70px;">
	<h1 class="title--write">공지 작성</h1>
	<div class="inquriy--classification">
		<div class="inquiry--radioList">
			<span>
				<input type="radio" name = "classification" id ="classification1" value="티캣 예매/취소"></input>
				<label for="classification1">티캣 예매/취소</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification2" value="공연/전시 프로그램"></input>
				<label for="classification2">공연/전시 프로그램</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification3" value="공연/전시장 관련"></input>
				<label for="classification3">공연/전시장 관련</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification4" value="홈페이지 이용"></input>
				<label for="classification4">홈페이지 이용</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification5" value="편의시설"></input>
				<label for="classification5">편의시설</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification6" value="기타"></input>
				<label for="classification6">기타</label>
			</span>
		</div>
	</div>
    <form method="post" action="/customerservice/inquiry/modify" id="form" onsubmit="return false;">
        <div style="display: flex;">
            <input type="text" id="title" name="title" style="width: 100%;" placeholder="제목" value="${inquiry.title}"/>
        </div>
        <br>
        <br>
        <textarea id="summernote" id="content" name="content">${inquiry.content}</textarea>
        <input id="subBtn" type="button" value="글 수정" onclick="sendInquiry()" />
        <input type="hidden" id="classification" name="classification" />
        <input type="hidden" name="id" value="${inquiry.id}" />
        <input type="hidden" name="page" value="${page}" />
    </form>
</div>

<script type="text/javascript" src="/resources/js/customerservice.js"></script>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>