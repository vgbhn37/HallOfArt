<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
	
<h1>로그인 페이지</h1>
<div class="bg-light p-md-5 h-75">
        <form action="/user/sign-in" method="post">
            <div class="form-group">
                <label for="username">username :</label>    
                <input type="text" id="username" class="form-control" placeholder="Enter username" name="username" >
            </div>    
            <div class="form-group">
                <label for="pwd">password :</label>    
                <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" >
            </div>    
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=a88c60cc6973f14916d03d7bd3f7c2a0&redirect_uri=http://localhost/user/kakao/callback"><img width="74" height="38" src="/images/kakao_login_small.png"></a>
        </form>

</div>
	

<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp" %>