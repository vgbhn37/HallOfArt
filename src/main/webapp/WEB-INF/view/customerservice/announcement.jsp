<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/announcement.css">
<!-- <style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 30px;
}

p {
	margin: 0;
}

td:nth-child(1) {
	width:20%;
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


.classification {
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

.title--announcement {
    position: relative;
    color: #535353;
    font-size: 35px;
    line-height: 35px;
    padding: 5px 0 20px 22px;
    margin-bottom: 35px;
    border-bottom: 1px solid #535353;
}

.title--announcement:before {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 12px;
    height: 12px;
    background: #ed1a3b;
    content: "";
}

.tab--announcement {
    padding: 0 0 1px 1px;
    margin-bottom: 30px;
    overflow: hidden;
}

.tab--announcement :hover{
	cursor: pointer;
}

.tab--announcement li{
	float: left;
    display: table;
    width: calc(20% - 2px);;
    height: 66px;
    position: relative;
    box-sizing: border-box;
    margin-right: 0px;
}

.tab--announcement li:last-child {
    border-right: none; 
}

.tab--announcement li a {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    font-size: 16px;
    color: #8b8b8b;
    line-height: 20px;
    padding: 5px 8px;
}

.tab--announcement > li.on::before {
    z-index: 10;
    border: 1px solid #222;
}

.tab--announcement > li::before {
    position: absolute;
    top: 0;
    left: -1px;
    width: calc(100% - 1px);
    height: calc(100% - 1px);
    border: 1px solid #e5e5e5;
    content: "";
}

.tab--announcement::after {
    content: "";
    display: table;
    clear: both;
}

*, ::after, ::before {
    box-sizing: content-box;
}

.tab--announcement li.active {
  border: 2px solid #222; 
  border-top: 1px solid #222;
}

.tab--announcement li.active a {
  font-weight: bold;
  color: black;
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

.write-btn {
    display: inline-block;
    padding: 10px 20px;
	border: 1px solid black;
    background-color: #fff;
    color: #151432;
    margin-bottom: 50px;
    text-decoration: none !important;
    transition: background-color 0.3s, color 0.3s;
}

.write-btn:hover {
    background-color: #151432;
    color: #fff;
}

</style> -->
<div class="container">
	<h1 class = "title--announcement">공지사항</h1>
	
	<ul class = tab--announcement>
	    <li class="active" data-classification="전체"><a href="#">전체</a></li>
	    <li data-classification="대관"><a href="#">대관</a></li>
	    <li data-classification="전시"><a href="#">전시</a></li>
	    <li data-classification="예매"><a href="#">예매</a></li>
	    <li data-classification="회원"><a href="#">회원</a></li>
	</ul>
	
	<table class="table">
		<tbody id="announcement-list-container">
		</tbody>
	</table>
	<div class="paging">
		<form action="<c:url value='/customerservice/announcement'/>"
			name="pageForm">
			<div class="text-center clearfix">
				<ul class="pagination" id="pagination--a">
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
	<c:if test="${user.roleTypeId == 2}">
	<a href="/customerservice/announcement/write" class="write-btn">글쓰기</a>
</c:if>
</div>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/announcement.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>