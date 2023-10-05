<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp"%>
<!-- --------------------------------------------------------- -->

<!-- <h1>회원가입</h1> -->
<!-- <div class="bg-light p-md-5 h-75"> -->
<!--        <form action="/user/sign-up" method="post" class="signUpForm"> -->
<!--            <div class="form-group"> -->
<!--              <label for="username">ID</label> -->
<!--              <input type="text" class="form-control" placeholder="아이디 입력" id="username" name="username"> -->
<!--            </div> -->
<!--            <div class="form-group"> -->
<!--              <label for="pwd">Password</label> -->
<!--              <input type="password" class="form-control" placeholder="비밀번호 입력" id="password" name="password"> -->
<!--            </div> -->
<!--            <div class="form-group"> -->
<!--              <label for="pwd">Email</label> -->
<!--              <input type="email" class="form-control" placeholder="이메일 입력 ex)hjm8333@naver.com" id="email" name="email"> -->
<!--            </div> -->
<!--            <div class="form-group"> -->
<!--              <label for="pwd">Tel</label> -->
<!--              <input type="text" class="form-control" placeholder="전화번호 입력 ex)01040618333" id="tel" name="tel"> -->
<!--            </div> -->
<!--            <div class="form-group"> -->
<!--              <label for="pwd">BirthDate</label> -->
<!--              <input type="text" class="form-control" placeholder="생년월일 입력 ex)1989-11-12" id="birthDate" name="birthDate"> -->
<!--            </div> -->
<!--            <button type="submit" class="btn btn-primary">Submit</button> -->
<!--          </form> -->
<!--    </div> -->

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
										<input type="text" id="username" name="username" placeholder="아이디 입력"
											class="form-control form-control" /> <label
											class="form-label" for="username">아이디</label>
									</div>
									<div class="form-outline mb-0">
										<input type="password" id="password" name="password" placeholder="비밀번호 입력"
											class="form-control form-control" /> <label
											class="form-label" for="password">비밀번호</label>
									</div>
									<div class="form-outline mb-0">
										<input type="password" id="password2" name="password2" placeholder="비밀번호 입력"
											class="form-control form-control" /> <label
											class="form-label" for="password2">비밀번호 확인</label>
									</div>
									<div class="form-outline mb-0">
										<input type="email" id="email" name="email" placeholder="ex) hjm8333@naver.com"
											class="form-control form-control" /> <label
											class="form-label" for="email">이메일</label>
									</div>
									<div class="form-outline mb-0">
										<input type="text" id="tel" name="tel" placeholder="ex) 01040618333"
											class="form-control form-control" /> <label
											class="form-label" for="tel">전화번호</label>
									</div>
									<div class="form-outline mb-0">
										<input type="text" id="birthDate" name="birthDate" placeholder="ex) 1989-11-12"
											class="form-control form-control" /> <label
											class="form-label" for="birthDate">생년월일</label>
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
	
	});
</script>


<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp"%>


