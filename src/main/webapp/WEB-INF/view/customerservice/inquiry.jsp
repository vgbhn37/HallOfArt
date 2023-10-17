<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/resources/css/inquiry.css">

<!-- body  -->
<div class="container">
	<h1 class="title--inquiry">1:1 문의하기</h1>
	<div class="inquriy--classification">
		<div class="inquiry--radioList">
			<span>
				<input type="radio" name = "classification" id ="classification1" value="티캣 예매/취소"></input>
				<label for="classification1">티캣 예매/취소</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification2" value="공연/전시 프로그램"></input>
				<label for="classification2">공연/전시 프로그램</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification3" value="공연/전시장 관련"></input>
				<label for="classification3">공연/전시장 관련</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification4" value="홈페이지 이용"></input>
				<label for="classification4">홈페이지 이용</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification5" value="편의시설"></input>
				<label for="classification5">편의시설</label>
			</span>
			<span>
				<input type="radio" name = "classification" id = "classification6" value="기타"></input>
				<label for="classification6">기타</label>
			</span>
		</div>
	</div>
	<form method="post" action="/customerservice/inquiry/write" id="form" onsubmit="return false;">
        <div style="display: flex;">
            <input type="text" id="title" name="title" style="width: 100%; margin-top: 30px;" placeholder="제목" />
        </div>
        <br>
        <br>
        <textarea id="summernote" id="content" name="content"></textarea>
        <input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="sendInquiry()" />
        <input type="hidden" id="classification" name="classification" />
    </form>
    
    <h1 class="title--inquiry" style="margin-top: 120px;">나의 문의</h1>
    
    <table class="table">
		<tbody id="inquiry-list-container">
			<c:forEach var="inquiry" items="${inquiryList}">
				<tr>
					<td><a href="/customerservice/inquiry/detail?page=${paging.page}&id=${inquiry.id}">${inquiry.title}</a></td>
					<td>
						<c:choose>
						<c:when test="${inquiry.answer == 1}">
							답변완료
						</c:when>
						<c:otherwise>
							답변미완료
						</c:otherwise>
						</c:choose>
					</td>
					<td><a href="#">${inquiry.createdAt}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="paging">
		<form action="<c:url value='/customerservice/inquiry'/>"
			name="pageForm">
			<div class="text-center clearfix">
				<ul class="pagination" id="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item "><a class="page-list" href="#"
							data-page="${pagination.beginPage-1}">Prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pagination.beginPage}"
						end="${pagination.endPage}">
						<li
							class="${pagination.paging.page == num ? 'age-item active' : ''} page-item"
							><a class="page-list" href="#" data-page="${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-list" href="#"
							data-page="${pagination.endPage+1}">Next</a></li>
					</c:if>
				</ul>

				<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
				<input type="hidden" id="page" name="page" value="${pagination.paging.page}">
				<input type="hidden" name="recordSize"
					value="${pagination.paging.recordSize}">

			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="/resources/js/common.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>