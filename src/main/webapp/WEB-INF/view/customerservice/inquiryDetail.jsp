<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>

<!-- 문의내용  -->
<main class="mb-4">
  <div class="container px-4 px-lg-5">
    <div class="row gx-4 gx-lg-5 justify-content-center">
      <div class="container List-container">
        <div class="row mt-1 header">
          <h5 class="col-1 board-title">제목</h5>
          <p class="col-8" style="word-break:break-all;">${inquiry.title}</p>
        </div>
        <div class="board-container">
          <h5 class="content-title">내용</h5>
          <p class="content" style="word-break:break-all;">
          ${inquiry.content}
          </p>
        </div>
        <div class="board-footer">
          <a href="/customerservice/inquiry?page=${page}" class="btn btn-primary list-btn">목록</a>
          <a href="/customerservice/inquiry/modify?id=${inquiry.id}&page=${page}" class="btn btn-primary list-btn">수정하기</a>
          <a href="/customerservice/inquiry/delete?id=${inquiry.id}" class="btn btn-danger list-btn">삭제</a>
          <!-- TODO : 관리자만 버튼 활성화 -->
          <button id="answerBtn" class="btn btn-primary">답변하기</button>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- 답변내용  -->
<c:if test="${inquiry.answer == 1}">
<main class="mb-4">
  <div class="container px-4 px-lg-5">
    <div class="row gx-4 gx-lg-5 justify-content-center">
      <div class="container List-container">
        <div class="row mt-1 header">
          <h5 class="col-1 board-title">제목</h5>
          <p class="col-8" style="word-break:break-all;">${answer.title}</p>
        </div>
        <div class="board-container">
          <h5 class="content-title">내용</h5>
          <p class="content" style="word-break:break-all;">
          ${answer.content}
          </p>
        </div>
      </div>
    </div>
  </div>
</main>
</c:if>

<!-- 답변하기  -->
<div style="display : none;" id="answerForm">
	<form action="/customerservice/inquiry/answer" method="post">
			<div class="mb-3">
			  <label for="title" class="form-label">title</label>
			  <input type="text" class="form-control" id="title" name="title">
			</div>
			<div class="mb-3">
			  <label for="content" class="form-label">content</label>
			  <textarea class="form-control" id="content" rows="8" name="content"></textarea>
			</div>
			<input type="hidden" id="inquiryId" name="inquiryId" value="${inquiry.id}">
			<input type="hidden" id="page" name="page" value="${page}">
			<button type="submit" class="btn btn-primary">글쓰기</button>
	</form>
</div>

<script>
	//답변하기 버튼 클릭시 답변작성 폼 활성화
	document.querySelector("#answerBtn").addEventListener("click", function(){
	    let answerForm = document.querySelector("#answerForm")
	    answerForm.style.display = "";
	})
</script>
<%@include file="/WEB-INF/view/layout/footer.jsp" %>