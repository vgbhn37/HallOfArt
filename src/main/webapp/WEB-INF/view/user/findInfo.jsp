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
<!-- --------------------------------------------------------- -->

<div class="card text-center p-3" style="width: 500px; font-family: 'NanumSquareRound';">
    <div class="card-header h5 text-white bg-dark">
	    <i class="fa-solid fa-user-pen"></i>
	    <span class="h5 fw-bold mb-0">&nbsp;임시 비밀번호</span>
    </div>
    <div class="card-body px-5">
        <div class="form-outline">
        <label class="h5 form-label my-2" >두 항목 모두 입력해 주세요</label>
            <div class="form-outline mb-2">
				<label class="form-label my-0" style="display: flex; margin-left: 13px;">이메일</label>
				<input type="text" id="email" name="email" placeholder="이메일 입력 ex) hjm8333@naver.com" class="form-control form-control"/> 
			</div>
            <div class="form-outline mb-2">
				<label class="form-label my-0" style="display: flex; margin-left: 13px;">전화번호</label>
				<input type="text" id="tel" name="tel" placeholder="전화번호 입력 ex) 01040618333" class="form-control form-control"/> 
			</div>
        </div>
        <label class="form-label my-1" for="sendConfirm" id="sendConfirm"></label>
        <div>
	        <button class="btn btn-outline-dark ml-1" type="button" id="findByEmail">이메일로 보내기</button>
	        <button class="btn btn-outline-dark ml-1" type="button" id="findByTel">휴대전화로 보내기</button>
        </div>
    </div>
</div>

<script>
	
</script>