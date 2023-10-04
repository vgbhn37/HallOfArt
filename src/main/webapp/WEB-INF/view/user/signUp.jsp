<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->
	
<h1>회원가입</h1>
<div class="bg-light p-md-5 h-75">
       <form action="/user/sign-up" method="post" class="signUpForm">
           <div class="form-group">
             <label for="username">ID</label>
             <input type="text" class="form-control" placeholder="아이디 입력" id="username" name="username">
           </div>
           <div class="form-group">
             <label for="pwd">Password</label>
             <input type="password" class="form-control" placeholder="비밀번호 입력" id="password" name="password">
           </div>
           <div class="form-group">
             <label for="pwd">Email</label>
             <input type="email" class="form-control" placeholder="이메일 입력 ex)hjm8333@naver.com" id="email" name="email">
           </div>
           <div class="form-group">
             <label for="pwd">Tel</label>
             <input type="text" class="form-control" placeholder="전화번호 입력 ex)01040618333" id="tel" name="tel">
           </div>
           <div class="form-group">
             <label for="pwd">BirthDate</label>
             <input type="text" class="form-control" placeholder="생년월일 입력 ex)1989-11-12" id="birthDate" name="birthDate">
           </div>
           <button type="submit" class="btn btn-primary">Submit</button>
         </form>
   </div>
	

<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp" %>

<script>

    $('.signUpForm').on('submit',()=>{
    	let idval = $('#username').val();
        let idvalcheck = /^[a-z0-9]+$/;
        if (!idvalcheck.test(idval) || idval.length<6){
        	alert('아이디는 영소문자,숫자로 된 6자 이상이어야 합니다.');
            $('#username').focus();
            return false
        }
    	
    	let dateval = $('#birthDate').val(); 
    	const dateRegex = /^\d{4}\d{2}\d{2}$/; // YYYYMMDD 형식의 정규식
		const dateRegex2 = /^\d{4}-\d{2}-\d{2}$/; // YYYY-MM-DD 형식의 정규식
		const dateRegex3 = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/; // YYYYMMDD 각 자리에 유효한 생년월일인지 확인
		const dateRegex4 = /^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$/; // YYYY-MM-DD 각 자리에 유효한 생년월일인지 확인
		
		if (dateRegex.test(dateval) || dateRegex2.test(dateval)) {
		    if (dateRegex3.test(dateval) || dateRegex4.test(dateval)) return true;
			else {
				alert('생년월일 숫자를 확인해주세요');
				return false;
			}
		} else {
			alert('생년월일 형식을 확인해주세요 ex)1989-11-12');
            $('#birthDate').focus();
            return false
		}
    	
    })
    
//     $('.signUpForm').on('submit',()=>{
//     	let pwdval = $('#password').val()
//         let pwdokval = $('#passwordCheck').val()
//         let pwdcheck = /^[a-zA-Z0-9]+$/
//         if (!pwdcheck.test(pwdval) || pwd.length<8){
//         	alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.')
//         	$('#password').focus()
//         } else {
//         	if (pwdokval){
//             	if (pwd!==pwdokval){
//                 	alert('비밀번호가 일치하지 않습니다.')
//                     $('#passwordCheck').focus()
//                     return false
//                 } 
//             } else {
//             	alert('비밀번호확인을 입력하시오.')
//                 $('#passwordCheck').focus()
//                 return false
//             }
//         }
//     }
</script>
