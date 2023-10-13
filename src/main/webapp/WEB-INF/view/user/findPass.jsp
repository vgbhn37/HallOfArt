<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>비밀번호 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>

<body>

<div class="card text-center p-3" style="width: 490px; font-family: 'NanumSquareRound';">
    <div class="card-header h5 text-white bg-dark">
	    <i class="fa-solid fa-magnifying-glass"></i>
	    <span class="h5 fw-bold mb-0">&nbsp;임시 비밀번호 발급</span>
	    <span class="h5 fw-bold mb-0" style="float: right;"><i class="fa-solid fa-xmark fa-2xl" style="cursor: pointer;" onclick="window.close(); return false;"></i></span>
    </div>
    <div class="card-body border-left border-right pb-0">
        <div class="form-outline" style="display: flow-root;">
       			<div class="mb-2">
						<span>아이디</span>
						<input style="margin : 0 auto; width: 50%" type="text" id="username" name="username" placeholder="아이디를 입력해주세요" class="form-control form-control"/>
				</div>
	            <div class="form-outline">
	            	<div style="float: left;">
						<span>이메일</span>
						<input style="margin-bottom: 5px;" type="email" id="email" name="email" placeholder="ex)fdpass@naver.com" class="form-control form-control"/>
					</div>
					<div style="float: right;"> 
						<span>전화번호</span>
						<input type="text" id="tel" name="tel" placeholder="ex)01040618333" class="form-control form-control" maxlength="11"/>
					</div> 
				</div>
			
        </div>
    </div>
    <div class="border-left border-right border-bottom">
			<div>
				<span id="sendConfirm">아이디를 반드시 입력해주세요</span>
			</div>
        <div class="ml-3">
        	<button class="btn btn-outline-dark mb-1" id="sendEmail">이메일로 찾기</button>
        	<button class="btn btn-outline-dark mb-1" id="sendTel">전화번호로 찾기</button>
        </div>
    </div>
</div>

<script>

$(document).ready(function() {
	
    $('#sendEmail').on('click', function() {
    	
    	let idval = $('#username').val();
		let idvalcheck = /^[a-z0-9]+$/;
		if (!idvalcheck.test(idval) || idval.length < 6) {
			alert('아이디는 영소문자,숫자로 된 6자 이상이어야 합니다.');
			$('#username').focus();
			return false
		}
    	
        let emailval = $('#email').val();
        const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (!emailRegex.test(emailval)) {
            alert('이메일 형식을 확인해주세요 ex) hjm8333@naver.com');
            $('#email').focus();
            return false;
        }

        $.ajax({
			type : "POST",
			url : "/user/find-pass",
			data : {
				"username" : idval,
				"email" : emailval
			},
			success : function(data){
				if(data === 400) {
					$("#sendConfirm").html("이메일로 임시 비밀번호가 발송되었습니다.");
					$("#sendEmail").prop("disabled", true);
					$("#sendEmail").css("background", "#bbbbbb");
				} else if(data === 501) {
					alert('아이디의 이메일이 입력하신 이메일과 일치하지 않습니다.');
		            $('#email').focus();
				} else {
					alert('존재하지 않는 아이디 입니다.');
		            $('#username').focus();
				}
			}
			,error: function(){
				alert('서버 에러입니다.');
			}
		});
    });
    
	$('#sendTel').on('click', function() {
		
		let idval = $('#username').val();
		let idvalcheck = /^[a-z0-9]+$/;
		if (!idvalcheck.test(idval) || idval.length < 6) {
			alert('아이디는 영소문자,숫자로 된 6자 이상이어야 합니다.');
			$('#username').focus();
			return false
		}
    	
        let telval = $('#tel').val();
        const telRegex = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
        
        if (!telRegex.test(telval)) {
            alert('전화번호 양식이 맞지 않습니다 ex) 01040618333');
            $('#tel').focus();
            return false;
        }

        $.ajax({
			type : "POST",
			url : "/user/find-pass",
			data : {
				"username" : idval,
				"tel" : telval
			},
			success : function(data){
				if(data === 400) {
					$("#sendConfirm").html("전화번호로 임시 비밀번호가 발송되었습니다.");
					$("#sendTel").prop("disabled", true);
					$("#sendTel").css("background", "#bbbbbb");
				} else if(data === 502) {
					alert('아이디의 전화번호가 입력하신 전화번호와 일치하지 않습니다.');
		            $('#tel').focus();
				} else {
					alert('존재하지 않는 아이디 입니다.');
		            $('#username').focus();
				}
			}
			,error: function(){
				alert('서버 에러입니다.');
			}
		});
    });
    
});
 
</script>