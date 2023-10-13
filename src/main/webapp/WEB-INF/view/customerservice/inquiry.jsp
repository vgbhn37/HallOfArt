<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
.title--inquiry {
    position: relative;
    color: #535353;
    font-size: 35px;
    line-height: 35px;
    padding: 5px 0 20px 22px;
    margin-bottom: 35px;
    margin-top: 40px;
    border-bottom: 1px solid #535353;
}

.title--inquiry:before {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 12px;
    height: 12px;
    background: #ed1a3b;
    content: "";
}
.inquriy--classification{
	background: #f9f6f6;
    display: flex;
    align-items: center;
}
.inquiry--radioList{
	width:100%;
}
.inquiry--radioList span {
    display: inline-block;
    position: relative;
    min-height: 25px;
    margin: 24px 24px 24px 40px;
    vertical-align: middle;
}
.inquiry--radioList span input{

}
.inquiry--radioList span label {
    font-size: 15px;
    color: #333333;
    line-height: 25px;
    padding-left: 5px;
}

	#subBtn {
		margin-top: 40px;
		display: inline-block;
	    padding: 10px 20px;
		border: 1px solid black;
	    background-color: #fff;
	    color: #151432;
	    margin-bottom: 50px;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	    font-weight: bold;
	}
	
	#subBtn:hover {
	    background-color: #151432;
    	color: #fff;
	}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 30px;
	border-bottom: 1px solid #ddd;
}

p {
	margin: 0;
}

td:nth-child(1) {
	padding-left: 15px;
	width:50%;
}

td:last-child{
	text-align: right;
	width:30%;
}

td {
	vertical-align: middle;
}

td a {
    color: black;
    text-decoration: none !important;
    margin-left: 15px;
}


.table-classification {
	border: 1px solid #ed1a3b;
    color: #ed1a3b;
    display: inline-block;
    padding: 8px 10px;
}

.container {
	margin-top: 50px;
	width: 65%;
}

.write-btn {
	text-align: right;
}
.paging {
    text-align: center;
    margin-top: 40px;
    margin-bottom : 40px;
}

.pagination {
    display: inline-block;
}

.pagination li {
    display: inline-block;
    list-style: none;
}

.pagination li a {
    display: inline-block;
    padding: 5px 10px;
    border: 1px solid #ddd;
    background-color: #fff;
    color: #151432;
    border-radius: 5px; 
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.pagination li a:hover {
    background-color: #151432; 
    color: #fff; 
}

.pagination li.active a{
	background-color: #151432; 
    color: #fff;
}

</style>
<body>
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
		<form action="<c:url value='/customerservice/announcement'/>"
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