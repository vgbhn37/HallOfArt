<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>HallOfArt - Admin</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="/css/admin_styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
.insertShow_content {
	width: 100%;
	min-height: 800px;
	border: 1px solid black;
}

#showList {
	border: 1px solid grey;
	margin: auto;
	margin-top: 50px;
	max-width: 1000px;
	width: 90%;
	text-align: center;
}

.contentTr {
	text-align: left;
}

tr {
	height: 50px;
	box-sizing: border-box;
}

.pagination {
	justify-content: center;
}
</style>

</head>
<%@ include file="/WEB-INF/view/layout/admin_header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연/전시 조회</h1>
			<div class="insertShow_content">
				<table id="showList">
					<tr style="height: 70px; padding-top: 30px;">
						<td style="width: 10%">no.</td>
						<td style="width: 10%">유형</td>
						<td style="width: 25%">제목</td>
						<td style="width: 25%">날짜</td>
						<td style="width: 25%">상태</td>
					</tr>
					<c:forEach var="li" items="${list}" varStatus="status">
						<c:choose>
							<c:when test="${status.count % 2 ==0}">
								<tr style="background-color: rgb(245, 245, 245)">
							</c:when>
							<c:otherwise>
								<tr style="background-color: rgb(230, 230, 230)">
							</c:otherwise>
						</c:choose>
						<td>${li.id}</td>
						<td>
							<c:choose>
								<c:when test="${li.showTypeId1==1}">
				                   				공연
		                   					</c:when>
								<c:when test="${li.showTypeId1==2}">
				                   				전시
		                   					</c:when>
								<c:otherwise>
				                   				해당없음 ( ${li.showTypeId1} )
		                   					</c:otherwise>
							</c:choose>

						</td>
						<td class="titleTd">${li.title}</td>
						<td>${li.startDate}~ ${li.endDate}</td>
						<td>
							<c:forEach var="rental" items="${rental}">
								<c:if test="${li.id eq rental.showTbId}">
									<c:set var="s" value="${rental.status}"/>
								</c:if>
							</c:forEach>
							<input type="hidden" id="statusId" value="${li.id}">
							<select id="selectStatus" required>
								<option value="none" selected disabled>${s}</option>
								<option value="승인 요청">승인 요청</option>
								<option value="결제 요청">승인 (결제 요청)</option>
								<option value="결제됨">결제됨</option>
								<option value="취소">취소</option>
							</select>
							<button class="statusBtn">확인</button>
						</td>
						</tr>
						<c:choose>
							<c:when test="${status.count % 2 ==0}">
								<tr class="contentTr" style="background-color: rgb(245, 245, 245)">
							</c:when>
							<c:otherwise>
								<tr class="contentTr" style="background-color: rgb(230, 230, 230)">
							</c:otherwise>
						</c:choose>
						<td style="text-align: center;">내용</td>
						<td colspan="3" style="padding: 10px;">${li.content}</td>
						<td style="padding: 20px;">
							<img src="/imagePath/${li.showImg}" style="width: 100%; height: 100%;">
						</td>
						</tr>
					</c:forEach>
				</table>
				<div class="paging">
					<form action="showList" name="pageForm">
						<div class="text-center clearfix">
							<ul class="pagination" id="pagination">
								<c:if test="${pagination.prev}">
									<li class="page-item "><a class="page-link" href="#" data-page="${pagination.beginPage-1}">Prev</a></li>
								</c:if>

								<c:forEach var="num" begin="${pagination.beginPage}" end="${pagination.endPage}">
									<li class="${pagination.paging.page == num ? 'age-item active' : ''}" page-item><a class="page-link" href="#" data-page="${num}">${num}</a></li>
								</c:forEach>

								<c:if test="${pagination.next}">
									<li class="page-item"><a class="page-link" href="#" data-page="${pagination.endPage+1}">Next</a></li>
								</c:if>
							</ul>

							<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
							<input type="hidden" name="page" value="${pagination.paging.page}">
							<input type="hidden" name="recordSize" value="${pagination.paging.recordSize}">

						</div>
					</form>
				</div>
				<hr style="width: 80%; margin: 30px auto;">
				<div class="search float-end" style="width: 81%;">
					<form action="http://localhost/admin/showList">
						<input type="text" name="search" value="" placeholder="검색할 공연/전시 이름을 입력하세요" style="width: 25%; margin: 0px 5px;">
						<button class="btn btn-primary btn-sm" type="submit" style="margin-top: -2px">검색</button>
					</form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>
</div>
<script>
	$(function() {
		$(".statusBtn").on(
				"click",
				function() {
					let id = $(this).prev().prev().val();
					let status = $(this).prev().val();
					if (status == null) {
						alert("변경할 상태를 지정해주세요");
					} else {
						location.href = "updateStatus?id=" + id
								+ "&status=" + status;
					}
				});

		$(".contentTr").hide();
		$(".titleTd").on("click", function() {
			let content = $(this).parent().next(".contentTr");
			content.toggle();
		});

		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('page');
			console.log(value);
			document.pageForm.page.value = value;
			document.pageForm.submit();
		});

		$(".titleTd").hover(function() {
			$(this).css("background-color", "bold");
			$(this).parent().css("border", "1px solid black");
		}, function() {
			$(this).css("font-weight", "normal");
			$(this).parent().css("border", "none");
		});
	});
</script>
</body>
</html>
