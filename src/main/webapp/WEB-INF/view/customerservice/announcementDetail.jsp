<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
<style>
    .title--detail {
	    position: relative;
	    color: #535353;
	    font-size: 35px;
	    line-height: 35px;
	    padding: 5px 0 20px 22px;
	    border-bottom: 1px solid #000;
	    margin-bottom: 35px;
	}
	.title--detail:before {
	    position: absolute;
	    top: 0;
	    left: 0;
	    display: block;
	    width: 12px;
	    height: 12px;
	    background: #ed1a3b;
	    content: "";
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
</style>

<div class= "container" style="margin-top: 70px; width:80%">
	<h1 class="title--detail">공지 사항</h1>
	<!-- 제목 카테고리  -->
	<div class="title--box">
		<p class="">${announcement.title}</p>
		<p class="classification">${announcement.classification}</p>
	</div>
	<!-- 작성일 -->
	<p class="createdAt">${announcement.createdAt}</p>
	<!-- 내용 -->
	<div class="content">
		<p>${announcement.content}</p>
	</div>
	<!-- 하단버튼  -->
	<div class="detail--footer">
		<a href="/customerservice/announcement?page=${page}" id="listBtn">목록</a>
		<c:if test="${user.roleTypeId == 2}">
			<a
				href="/customerservice/announcement/modify?id=${announcement.id}&page=${page}" id="modifyBtn">수정하기</a>
			<a
				href="/customerservice/announcement/delete?id=${announcement.id}" id="deleteBtn">삭제</a>
		</c:if>
	</div>
	
</div>
<script type="text/javascript" src="/resources/js/common.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>