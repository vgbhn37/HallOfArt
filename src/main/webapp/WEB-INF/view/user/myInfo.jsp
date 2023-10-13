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
							<img src="../resources/images/img335.png" alt="login form"
								class="img-fluid"
								style="border-radius: 1rem 0 0 1rem; max-width: 115.5%; height: 644px;" />
						</div>
						<div class="col-md-6 col-lg-7 d-flex align-items-center">
							<div class="card-body text-black" style="padding: 0.5rem 3rem;">
								<form action="/user/modify-info" method="post" class="signUpForm">
									<div class="d-flex align-items-center mb-3 pb-1">
										<i class="fa-solid fa-user-pen fa-2xl"></i> <span
											class="h1 fw-bold mb-0">&nbsp;회원정보 수정</span>
									</div>
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="username" id="idconfirmTxt">아이디</label>
										<div style="display: flex;">
											<input type="text" id="username" value="${user.username}" class="form-control form-control" readonly="readonly"/> 
										</div>
									</div>
									
									<c:if test="${empty iskakao}">
										<div class="form-outline mb-0">
										<label class="form-label my-0" for="password">현재 비밀번호</label>
											<div style="display: flex;">
												<input style="width: 79%" type="password" id="password" placeholder="비밀번호 입력" class="form-control form-control" />
												<button class="btn btn-outline-dark ml-1" type="button" id="changePassword">변경하기</button>
											</div> 
										</div>
										
										<input type="hidden" id="pwdChanged" value="false">
										
										<div id="passCheckArea" style="display: none;">
											<div class="form-outline mb-0">
												<label class="form-label my-0" for="password2">새 비밀번호</label>
												<input type="password" id="password2" name="password" placeholder="새 비밀번호 입력" class="form-control form-control" /> 
											</div>
											
											<div class="form-outline mb-0">
												<label class="form-label my-0" for="password3">새 비밀번호 확인</label>
												<input type="password" id="password3" placeholder="새 비밀번호 확인" class="form-control form-control" /> 
											</div>
										</div>
									</c:if>
										
										<div class="form-outline mb-0">
											<label class="form-label my-0" for="email">이메일</label>
											<div style="display: flex;">
												<input type="email" id="email" value="${user.email}" class="form-control form-control" readonly="readonly" />
											</div>
										</div>
									
									<c:if test="${empty iskakao}">
									
										<div class="form-outline mb-0">
											<label class="form-label my-0" for="tel">휴대전화 번호</label>
											<div style="display: flex;">
												<input style="width: 79%; background-color: #bbbbbb" type="text" id="tel" name="tel" value="${user.tel}" class="form-control form-control" readonly="readonly"/>
												<button class="btn btn-outline-dark ml-1" type="button" id="changeTel">변경하기</button>
											</div> 
										</div>
										
										<input type="hidden" id="telChanged" value="false">
										
										<div class="form-outline mb-0" id="telCheckArea" style="display: none;">
											<label class="form-label my-0" for="telconfirm" id="telconfirmTxt">휴대전화 인증번호</label> <span id='timer1'> </span>
											<div style="display: flex;">
												<input style="width: 79%" type="text" id="telconfirm" placeholder="휴대전화 인증번호 입력" class="form-control form-control"/>
												<button class="btn btn-outline-dark ml-1" type="button" id="checkTel">인증하기</button>
											</div>
										</div>
									
									</c:if>
									
									<div class="form-outline mb-0">
										<label class="form-label my-0" for="birthDate">생년월일</label>
										<c:choose>
											<c:when test="${user.birthDate != '3000-01-01'}">
												<input type="text" id="birthDate" name="birthDate" value="${user.birthDate}" class="form-control form-control" maxlength="10"/>
											</c:when>
											<c:otherwise>
												<input type="text" id="birthDate" name="birthDate" placeholder="카카오 회원이므로 생년월일을 등록해 주세요" class="form-control form-control" maxlength="10"/>
											</c:otherwise> 
										</c:choose>
									</div>
									
									<div class="pt-1 mb-4">
										<button class="btn btn-dark btn-lg btn-block"
											style="font-size: 0.8rem;" type="submit">정보수정</button>
									</div>
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
	let telCheck = false;
	let startTime1;
	
	var $tel = $("#tel");
	var $checkTel = $("#checkTel"); 
	var $telconfirm = $("#telconfirm");
	var $telconfirmTxt = $("#telconfirmTxt");
	let interval1;
	
	$('#checkTel').on('click', () => {

		let telval = $('#tel').val();
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
				$("#changeTel").prop("disabled", true);
				$("#changeTel").css("background", "#bbbbbb");
				telCheck = true;
			}
		});
	}
	
	

	$('.signUpForm').on('submit', () => {
		
		<c:if test="${empty iskakao}">
		
			let oldpass = `${user.password}`;
			let oldpass2 = $('#password').val();
			
			if(oldpass !== oldpass2) {
				alert('비밀번호가 기존 비밀번호와 일치하지 않습니다.');
				$('#password').focus();
				return false;
			}
			
			if(pwdChanged === "true") {
				
				let pwdval = $('#password2').val();
				let pwdokval = $('#password3').val();
				let pwdcheck = /^[a-zA-Z0-9]+$/;
			
				if (!pwdcheck.test(pwdval) || pwdval.length < 8) {
					alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.');
					$('#password2').focus();
					return false;
				} else {
					if (pwdokval) {
						if (pwdval !== pwdokval) {
							alert('비밀번호가 일치하지 않습니다.');
							$('#password3').focus();
							return false;
						}
					} else {
						alert('비밀번호 확인란을 입력하십시오.');
						$('#password3').focus();
						return false;
					}
				}
			}
		
		</c:if>
		
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
		
		
		let telChanged = $('#telChanged').val();
		
		if(telChanged === "true") {
			if(!telCheck) {
				alert('핸드폰 인증을 진행해주세요');
				$('#tel').focus();
				return false;
			}			
		}
	
	});
	
	$("#changePassword").click(function(){
		const target = $("#passCheckArea");
		if ( target.css("display") === "none" ) {
			$("input[id='pwdChanged']").val("true");
			target.slideDown();
		} else {
			$("input[id='pwdChanged']").val("false");
			target.slideUp();
		}
	});
	
	$("#changeTel").click(function(){
		
		let phoneNum = `${user.tel}`;
		
		const target = $("#telCheckArea");
		if ( target.css("display") === "none" ) {
			$("input[id='telChanged']").val("true");
			$("#tel").prop("readonly", false);
			$("#tel").css("background", "#fff");
			target.slideDown();
		} else {
			$("input[id='telChanged']").val("false");
			$("#tel").prop("readonly", true);
			$("#tel").css("background", "#bbbbbb");
			$("#tel").val(phoneNum);
			target.slideUp();
		}
	});
	
</script>


<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp"%>


