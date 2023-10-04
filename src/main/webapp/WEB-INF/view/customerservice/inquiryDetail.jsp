<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>
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
        </div>
      </div>
    </div>
  </div>
</main>
<%@include file="/WEB-INF/view/layout/footer.jsp" %>