<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	alert('결제에 성공했습니다.');
	localStorage.setItem("payStatus","success");
	window.close();
</script>