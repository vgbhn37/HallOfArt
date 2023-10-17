<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.modal-a{
		display: inline-block;
		background-color: white;
		border: 1px solid lightblue;
		width: 50px; height: 40px;
		text-align: center;
		border-radius: 10px;
		font-size: 15px;
		padding-top: 7px;
		margin: 20px auto;
		text-decoration: none;
		color: black;
	}
</style>
<div class="modal-header">
	<button type="button" class="close" data-bs-dismiss="modal">×</button>
	<h5 class="modal-title">대관할 홀을 선택해주세요</h5>
</div>
<div class="modal-body" style="text-align: center">
	<c:forEach var="hall" items="${halls}">
		<a class="modal-a" href="insertShow?name=${hall.name}">${hall.name}</a>
	</c:forEach>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button>
</div>