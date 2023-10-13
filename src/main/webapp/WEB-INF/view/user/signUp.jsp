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
								style="border-radius: 1rem 0 0 1rem; max-width: 115.5%; height: 669px;" />
						</div>
						<div class="col-md-6 col-lg-7 d-flex align-items-center">
							<div class="card-body text-black" style="padding: 0.5rem 3rem;">
								<form action="/user/sign-up" method="post" class="signUpForm">
									<div class="d-flex align-items-center mb-3 pb-1">
										<i class="fa-solid fa-user-plus fa-2xl"></i> <span
											class="h1 fw-bold mb-0">&nbsp;회원가입</span>
									</div>
									<!--                   <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">내용</h5> -->
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="username" id="idconfirmTxt">아이디</label>
										<div style="display: flex;">
											<input style="width: 79%" type="text" id="username" name="username" placeholder="아이디 입력" class="form-control form-control" /> 
											<button class="btn btn-outline-dark ml-1" type="button" id="checkId">중복검사</button>
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
											<button class="btn btn-outline-dark ml-1" type="button" id="checkEmail">인증받기</button>
										</div>
									</div>
									
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="emconfirm" id="emailconfirmTxt">이메일 인증번호</label> <span id='timer2'> </span>
										<input type="text" id="emconfirm" placeholder="이메일 인증번호 입력" class="form-control form-control"/> 
									</div>
									
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="tel">휴대전화 번호</label>
										<div style="display: flex;">
											<input style="width: 79%" type="text" id="tel" name="tel" placeholder="ex) 01040618333" class="form-control form-control" maxlength="11" />
											<button class="btn btn-outline-dark ml-1" type="button" id="checkTel">인증받기</button>
										</div> 
									</div>
									
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="telconfirm" id="telconfirmTxt">휴대전화 인증번호</label> <span id='timer1'> </span>
										<input type="text" id="telconfirm" placeholder="휴대전화 인증번호 입력" class="form-control form-control"/> 
									</div>
									
									<div class="form-outline mb-0">
									<label class="form-label my-0" for="birthDate">생년월일</label>
										<input type="text" id="birthDate" name="birthDate" placeholder="ex) 1989-11-12"
											class="form-control form-control" maxlength="10" /> 
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
	let telCheck = false;
	let startTime1;
	let startTime2;

	$('#checkId').on('click', () => {

		let idval = $('#username').val();
		let idvalcheck = /^[a-z0-9]+$/;
		if (!idvalcheck.test(idval) || idval.length < 6) {
			alert('아이디는 영소문자,숫자로 된 6자 이상이어야 합니다.');
			$('#username').focus();
			return false
		}
		
		$.ajax({
			type : "POST",
			url : "/user/duplicate-check",
			data : {
				"username" : idval
			},
			success : function(data){
				if (data === 200) {
						alert('사용 가능한 아이디입니다.');
						idCheck = true;
						
						let $idconfirmTxt = $("#idconfirmTxt");
						
						$idconfirmTxt.html("<span id='idconfirmchk'>사용가능한 아이디입니다.</span>")
						$("#idconfirmchk").css({
							"color" : "#0D6EFD",
							"font-weight" : "bold",
							"font-size" : "12px"
						});
						$("#checkId").prop("disabled", true);
						$("#checkId").css("background", "#bbbbbb");
						$("#username").prop("readonly", true);
						$("#username").css("background", "#bbbbbb");
					} else {
					alert('사용중인 아이디 입니다.');
					$('#username').focus();
				}
			}
			,error: function(){
				alert('서버 에러입니다.');
			}
		});
	});
	
	var $tel = $("#tel");
	var $checkTel = $("#checkTel"); 
	var $telconfirm = $("#telconfirm");
	var $telconfirmTxt = $("#telconfirmTxt");
	let interval1;
	
	$('#checkTel').on('click', () => {

		let telval = $('#tel').val();
// 		let telvalcheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; // - 있어도 없어도 되게
		let telvalcheck = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
		
		if (!telvalcheck.test(telval)) {
			alert('전화번호 양식이 맞지 않습니다 ex) 01040618333');
			$('#tel').focus();
			return false
		} 
		
		$.ajax({
			type : "POST",
			url : "/user/tel-duplicate-check",
			data : {
				"tel" : telval
			},
			success : function(data){
				if (data === 200) {
					$.ajax({
						type : "POST",
						url : "/user/sms-confirm",
						data : {
							"tel" : $tel.val()
						},
						success : function(data){
							alert("해당 휴대전화로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.");
							$telconfirmTxt.html("<span id='telconfirmchk'>인증번호가 발송되었습니다</span>");
							$("#telconfirmchk").css({
								"color" : "green",
								"font-weight" : "bold",
								"font-size" : "12px"
							});
							
							$("#timer1").css({
								"color" : "#7800f7",
								"font-weight" : "bold",
								"font-size" : "12px"
							});

							startTime1 = new Date().getTime() + 5 * 60 * 1000;
							interval1 = setInterval(updateTimer1, 1000);
// 							updateTimer1();
							
							chkTelConfirm(data, $telconfirm, $telconfirmTxt);
						}
					});
					} else {
					alert('사용중인 전화번호 입니다.');
					$('#tel').focus();
				}
			}
			,error: function(){
				alert('서버 에러입니다.');
			}
		});

	});
	
	function updateTimer1() {
		  
		  const currentTime = new Date().getTime();
		  const timeDifference = startTime1 - currentTime;

		  if (timeDifference <= 0) {
		    $("#timer1").text("시간 종료");
		    $("#timer1").css({
				"color" : "red"
			});
		    $telconfirmTxt.html("<span id='telconfirmchk'>시간이 초과되었습니다</span>");
		    $("#telconfirmchk").css({
				"color" : "#FA3E3E",
				"font-weight" : "bold",
				"font-size" : "12px"
			});
		    clearInterval(interval1);
		  } else {
		    const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
		    const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);
		    $("#timer1").text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
		  }
		}
	
	function chkTelConfirm(data, $telconfirm, $telconfirmTxt){
		$telconfirm.on("keyup", function(){
			$("#tel").prop("readonly", true);
			$("#tel").css("background", "#bbbbbb");
			if ($("#timer1").text() === "시간 종료") {
				$telconfirmTxt.html("<span id='telconfirmchk'>시간이 초과되었습니다</span>");
				$("#telconfirmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "12px"
				});
				$("#timer1").css({
					"color" : "white",
				});
				clearInterval(interval1);
				return false;
			}
			if (data != $telconfirm.val()) {
				$telconfirmTxt.html("<span id='telconfirmchk'>인증번호가 잘못되었습니다</span>");
				$("#telconfirmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "12px"
				});
			} else {
				clearInterval(interval1);
				$telconfirmTxt.html("<span id='telconfirmchk'>인증번호 확인 완료</span>");
				$("#telconfirmchk").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "12px"
				});
				$("#timer1").css({
					"display" : "none"
				});
				$("#telconfirm").prop("disabled", true);
				$("#telconfirm").css("background", "#bbbbbb");
				$("#checkTel").prop("disabled", true);
				$("#checkTel").css("background", "#bbbbbb");
				telCheck = true;
			}
		});
	}

	$('.signUpForm').on('submit', () => {
	
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
				alert('비밀번호 확인란을 입력하십시오.');
				$('#password2').focus();
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
				$('#birthDate').focus();
				return false;
			}
		} else {
			alert('생년월일 형식을 확인해주세요 ex)1989-11-12');
			$('#birthDate').focus();
			return false
		}
		
		if(!idCheck) {
			alert('아이디 중복검사를 해주세요');
			$('#username').focus();
			return false;
		}
		
		if(!emailCheck) {
			alert('이메일 인증을 진행해주세요');
			$('#email').focus();
			return false;
		}
		
		if(!telCheck) {
			alert('핸드폰 인증을 진행해주세요');
			$('#tel').focus();
			return false;
		}
	
	});
	
	var $email = $("#email");
	var $checkEmail = $("#checkEmail"); // 인증번호 발송 버튼
	var $emailconfirm = $("#emconfirm"); // 인증번호 확인input
	var $emailconfirmTxt = $("#emailconfirmTxt"); // 인증번호 확인 txt
	let interval2;
	
	$checkEmail.click(function() {

		const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!emailRegex.test($email.val())) {
			alert('이메일 형식을 확인해주세요 ex) hjm8333@naver.com');
			$('#email').focus();
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "/user/email-duplicate-check",
			data : {
				"email" : $email.val()
			},
			success : function(data){
				if (data === 200) {
						$.ajax({
							type : "POST",
							url : "/user/mail-confirm",
							data : {
								"email" : $email.val()
							},
							success : function(data){
								alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.");
								$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 발송되었습니다</span>")
								$("#emconfirmchk").css({
									"color" : "green",
									"font-weight" : "bold",
									"font-size" : "12px"
								});
								
								$("#timer2").css({
									"color" : "#7800f7",
									"font-weight" : "bold",
									"font-size" : "12px"
								});

								startTime2 = new Date().getTime() + 5 * 60 * 1000;
								interval2 = setInterval(updateTimer2, 1000);
// 								updateTimer2();
								
								chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
							}
						});
					} else {
					alert('사용중인 이메일 입니다.');
					$('#email').focus();
				}
			}
			,error: function(){
				alert('서버 에러입니다.');
			}
		});
	});
	
	function updateTimer2() {
		  
		  const currentTime = new Date().getTime();
		  const timeDifference = startTime2 - currentTime;

		  if (timeDifference <= 0) {
		    $("#timer2").text("시간 종료");
		    $("#timer2").css({
				"color" : "red"
			});
		    $emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
		    $("#emconfirmchk").css({
				"color" : "#FA3E3E",
				"font-weight" : "bold",
				"font-size" : "12px"
			});
		    clearInterval(interval2);
		  } else {
		    const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
		    const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);
		    $("#timer2").text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
		  }
		}
	
	function chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt){
		$emailconfirm.on("keyup", function(){
			$("#email").prop("readonly", true);
			$("#email").css("background", "#bbbbbb");
			if ($("#timer2").text() === "시간 종료") {
				$emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
				$("#emconfirmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "12px"
				});
				$("#timer2").css({
					"color" : "white",
				});
				clearInterval(interval2);
				return false;
			}
			if (data != $emailconfirm.val()) {
				$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>");
				$("#emconfirmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "12px"
				});
			} else {
				clearInterval(interval2);
				$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호 확인 완료</span>");
				$("#emconfirmchk").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "12px"
				});
				$("#timer2").css({
					"display" : "none"
				});
				$("#emconfirm").prop("disabled", true);
				$("#emconfirm").css("background", "#bbbbbb");
				$("#checkEmail").prop("disabled", true);
				$("#checkEmail").css("background", "#bbbbbb");
				emailCheck = true;
			}
		});
	}

</script>


<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp"%>


