<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
	
<h1>아이디 번호 ${user.id}</h1>
<h1>이름 ${user.username}</h1>
<h1>패스워드 ${user.password}님</h1>
<h1>이메일 ${user.email}님</h1>
<h1>전화번호 ${user.tel}님</h1>
<h1>생년월일 ${user.birthDate}님</h1>
<h1>가입일 ${user.regDate}님</h1>
<h1>권한번호 ${user.roleTypeId}님</h1>

<c:choose>
	<c:when test="${empty user}">
		비로그인
	</c:when>
	<c:otherwise>
		로그인
	</c:otherwise>
</c:choose>

	
<!-- --------------------------------------------------------- -->
<%@ include file="layout/footer.jsp" %>