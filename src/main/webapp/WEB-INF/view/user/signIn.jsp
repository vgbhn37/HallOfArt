<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->

<div style="background-image: linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url('../resources/images/1122.jpg'); background-size: contain; padding: 62.5px 0; font-family: 'NanumSquareRound';">
  <div class="container">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="../resources/images/img33.png"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; max-width: 115.5%;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
                <form action="/user/sign-in" method="post">
                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fa-solid fa-right-to-bracket fa-2xl"></i>
                    <span class="h1 fw-bold mb-0">&nbsp;로그인</span>
                  </div>
<!--                   <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">내용</h5> -->
                  <div class="form-outline mb-4">
                    <input type="text" id="username" name="username" class="form-control form-control-lg" />
                    <label class="form-label" for="username">아이디</label>
                  </div>
                  <div class="form-outline mb-4">
                    <input type="password" id="password" name="password"class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">비밀번호</label>
                  </div>
                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg" style="font-size: 0.8rem;" type="submit">로그인</button>
                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=a88c60cc6973f14916d03d7bd3f7c2a0&redirect_uri=http://localhost/user/kakao/callback"><img width="74" height="38" src="/images/kakao_login_small.png"></a>
                  </div>
                  <a class="small text-muted" onclick="window.open(this.href, '_blank', 'width=491, height=270'); return false;" href="http://localhost/user/find-id" target="_blank" ref="noreferrer noopener">아이디 까먹으셨읍니까?</a>
                  <a class="small text-muted" onclick="window.open(this.href, '_blank', 'width=500, height=312'); return false;" href="http://localhost/user/find-pass" target="_blank" ref="noreferrer noopener">비밀번호 까먹으셨읍니까?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">회원이 아니시면? <a href="http://localhost/user/sign-up"
                      style="color: crimson;">회원가입</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
	
<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp" %>