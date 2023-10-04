<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
	
<h1>아이디 번호ㅓ ${user.username}</h1>
<h1>이름 ${user.password}님</h1>
<h1>패스워드 ${user.email}님</h1>
<h1>이메일 ${user.tel}님</h1>
<h1>전화번호 ${user.birthDate}님</h1>
<h1>생년월일 ${user.regDate}님</h1>
<h1>가입일 ${user.roleTypeId}님</h1>
	
<!-- --------------------------------------------------------- -->
<%@ include file="layout/footer.jsp" %>