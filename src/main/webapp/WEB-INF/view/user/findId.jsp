<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>아이디 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" href="../resources/css/style.css"> -->
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
	    <span class="h5 fw-bold mb-0">&nbsp;아이디 찾기</span>
	    <span class="h5 fw-bold mb-0" style="float: right;"><i class="fa-solid fa-xmark fa-2xl" style="cursor: pointer;" onclick="window.close(); return false;"></i></span>
    </div>
    <div class="card-body border-left border-right pb-0">
        <div class="form-outline" style="display: flow-root;">
	            <div class="form-outline">
	            	<div style="float: left;">
						<label class="form-label">이메일</label>
						<input style="margin-bottom: 5px;" type="text" id="email" name="email" placeholder="ex)findid@naver.com" class="form-control form-control"/>
					</div>
					<div style="float: right;"> 
						<label class="form-label">전화번호</label>
						<input type="text" id="tel" name="tel" placeholder="ex)01040618333" class="form-control form-control" maxlength="11"/>
					</div> 
				</div>
			
        </div>
    </div>
    <div class="border-left border-right border-bottom">
			<div style="text-align: left; margin-left: 32px;">
				<span id="sendConfirm">&nbsp;</span>
			</div>
        <div>
        	<button class="btn btn-outline-dark mb-1" id="findIdButton">아이디 찾기</button>
        </div>
    </div>
</div>

<script>

$(document).ready(function() {
    $('#findIdButton').on('click', function() {
    	
        let emailval = $('#email').val();
        let telval = $('#tel').val();
        const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        const telRegex = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;

        if (emailval !== '' && !telRegex.test(telval)) {
            if (!emailRegex.test(emailval)) {
                alert('이메일 형식을 확인해주세요 ex) hjm8333@naver.com');
                $('#email').focus();
                return false;
            }
        }

        if (telval !== '' && !emailRegex.test(emailval)) {
            if (!telRegex.test(telval)) {
                alert('전화번호 양식이 맞지 않습니다 ex) 01040618333');
                $('#tel').focus();
                return false;
            }
        }
        
        if(emailval === '' && telval === '') {
        	alert('최소 하나의 항목은 값이 입력되어야 합니다.');
        	return false;
        }
        
        
        $.ajax({
			type : "POST",
			url : "/user/find-id",
			data : {
				"email" : emailval,
				"tel" : telval
			},
			success : function(data){
				$("#sendConfirm").html(data); // innerHTML을 사용하여 HTML 태그 해석
			}
			,error: function(){
				alert('서버 에러입니다.');
			}
		});
    });
});
 
</script>