<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp"%>
<!-- --------------------------------------------------------- -->

<div
	style="background-image: linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url('../resources/images/1122.jpg'); background-size: contain; padding: 62.5px 0; font-family: 'NanumSquareRound';">
	<div class="container">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-10">
				<div class="card" style="border-radius: 1rem;">
					<div class="row g-0">
						<div class="col-md-6 col-lg-5 d-none d-md-block">
							<img src="../resources/images/img34.png" alt="login form"
								class="img-fluid"
								style="border-radius: 1rem 0 0 1rem; max-width: 115.5%;" />
						</div>
						<div class="col-md-6 col-lg-7 d-flex align-items-center">
							<div class="card-body text-black" style="padding: 0.5rem 3rem;">
								<form action="/user/sign-up" method="post" class="signUpForm">
									<div class="d-flex align-items-center mb-3 pb-1">
										<i class="fa-solid fa-user-plus fa-2xl"></i> <span
											class="h1 fw-bold mb-0">&nbsp;회원가입 페이지</span>
									</div>
									<!--                   <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">내용</h5> -->
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="username">아이디</label>
										<div style="display: flex;">
											<input style="width: 79%" type="text" id="username" name="username" placeholder="아이디 입력" class="form-control form-control" /> 
											<button class="btn btn-outline-primary ml-1" type="button" id="checkId">중복검사</button>
										</div>
									</div>
									<div class="form-outline mb-0">
									<label class="form-label my-0" for="password">비밀번호</label>
										<input type="password" id="password" name="password" placeholder="비밀번호 입력"
											class="form-control form-control" /> 
									</div>
									<div class="form-outline mb-0">
									<label class="form-label my-0" for="password2">비밀번호 확인</label>
										<input type="password" id="password2" name="password2" placeholder="비밀번호 입력"
											class="form-control form-control" /> 
									</div>
									
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="email">이메일</label>
										<div style="display: flex;">
											<input style="width: 79%" type="email" id="email" name="email" placeholder="ex) hjm8333@naver.com" class="form-control form-control" />
											<button class="btn btn-outline-primary ml-1" type="button" id="checkEmail">인증받기</button>
										</div>
									</div>
									
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="emconfirm" id="emailconfirmTxt">인증번호</label>
										<input type="text" id="emconfirm" placeholder="인증번호 입력" class="form-control form-control"/> 
									</div>
									
									<div class="form-outline mb-0">
									<label class="form-label my-0" for="tel">전화번호</label>
										<input type="text" id="tel" name="tel" placeholder="ex) 01040618333"
											class="form-control form-control" /> 
									</div>
									<div class="form-outline mb-0">
									<label class="form-label my-0" for="birthDate">생년월일</label>
										<input type="text" id="birthDate" name="birthDate" placeholder="ex) 1989-11-12"
											class="form-control form-control" /> 
									</div>
									<div class="pt-1 mb-4">
										<button class="btn btn-dark btn-lg btn-block"
											style="font-size: 0.8rem;" type="submit">회원가입</button>
									</div>
									<p class="mb-0" style="color: #393f81;">
										이미 회원이시면? <a href="http://localhost/user/sign-in"
											style="color: crimson;">로그인</a>
									</p>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

	let emailCheck = false;
	let idCheck = false;

	$('#checkId').on('click', () => {
// 		$.ajax({
// 			type : "POST",
// 			url : "/user/duplicate-check",
// 			data : {
// 				"email" : $email.val()
// 			},
// 			success : function(data){
// 				if (data === 200) {
					
// 					};
// 				} else {
					
// 				}
// 			}
// 			,error: function(){
// 				alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.');
// 			}
// 		});
	});

	$('.signUpForm').on('submit', () => {
	
		let idval = $('#username').val();
		let idvalcheck = /^[a-z0-9]+$/;
		if (!idvalcheck.test(idval) || idval.length < 6) {
			alert('아이디는 영소문자,숫자로 된 6자 이상이어야 합니다.');
			$('#username').focus();
			return false
		}
	
		let pwdval = $('#password').val();
		let pwdokval = $('#password2').val();
		let pwdcheck = /^[a-zA-Z0-9]+$/;
	
		if (!pwdcheck.test(pwdval) || pwdval.length < 8) {
			alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.');
			$('#password').focus();
			return false;
		} else {
			if (pwdokval) {
				if (pwdval !== pwdokval) {
					alert('비밀번호가 일치하지 않습니다.');
					$('#password2').focus();
					return false;
				}
			} else {
				alert('비밀번호확인을 입력하십시오.');
				$('#passwordCheck').focus();
				return false;
			}
		}
	
		let dateval = $('#birthDate').val();
		const dateRegex = /^\d{4}\d{2}\d{2}$/; // YYYYMMDD 형식의 정규식
		const dateRegex2 = /^\d{4}-\d{2}-\d{2}$/; // YYYY-MM-DD 형식의 정규식
		const dateRegex3 = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/; // YYYYMMDD 각 자리에 유효한 생년월일인지 확인
		const dateRegex4 = /^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$/; // YYYY-MM-DD 각 자리에 유효한 생년월일인지 확인
	
		if (dateRegex.test(dateval) || dateRegex2.test(dateval)) {
			if (dateRegex3.test(dateval) || dateRegex4.test(dateval)) {
				
			}
			else {
				alert('생년월일 숫자를 확인해주세요');
				return false;
			}
		} else {
			alert('생년월일 형식을 확인해주세요 ex)1989-11-12');
			$('#birthDate').focus();
			return false
		}
		
		if(!emailCheck) {
			alert('이메일 인증을 진행해주세요');
			$('#email').focus();
			return false;
		}
	
	});
	
	var $email = $("#email");
	var $checkEmail = $("#checkEmail"); // 인증번호 발송 버튼
	var $emailconfirm = $("#emconfirm"); // 인증번호 확인input
	var $emailconfirmTxt = $("#emailconfirmTxt"); // 인증번호 확인 txt
	
	$checkEmail.click(function() {

		const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!emailRegex.test($email.val())) {
			alert('이메일 형식을 확인해주세요');
			$('#email').focus();
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "/user/mail-confirm",
			data : {
				"email" : $email.val()
			},
			success : function(data){
				alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
				chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
			}
		});
	});
	
	function chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt){
		$emailconfirm.on("keyup", function(){
			if (data != $emailconfirm.val()) {
				$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>")
				$("#emconfirmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "12px"
				})
			} else {
				$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호 확인 완료</span>")
				$("#emconfirmchk").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "12px"
				})
				$("#emconfirm").prop("disabled", true);
				$("#emconfirm").css("background", "#bbbbbb");
				$("#email").prop("readonly", true);
				$("#email").css("background", "#bbbbbb");
				$("#checkEmail").prop("disabled", true);
				$("#checkEmail").css("background", "#bbbbbb");
				emailCheck = true;
			}
		})
	}

</script>


<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp"%>


