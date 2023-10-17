<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.merchant_content {
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

tr {
	height: 50px;
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
			<h1 class="mt-4">결제 내역 조회</h1>
			<div class="merchant_content">
				<table id="showList">
					<tr style="height: 70px; padding-top: 30px;">
						<td style="width: 10%">공연 번호</td>
						<td style="width: 30%">공연 이름</td>
						<td style="width: 10%">대관 장소</td>
						<td style="width: 20%">결제 금액</td>
						<td style="width: 10%">상태 정보</td>
						<td style="width: 10%">신청인</td>
						<td style="width: 10%">환불 처리</td>
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
						<td>${li.showTbId}</td>
						<td>${li.title}</td>
						<td>${li.name}</td>
						<td>
							<fmt:formatNumber value="${li.amount}" pattern="#,###" />
						</td>
						<td>${li.status}</td>
						<td>${li.username}</td>
						<c:choose>
							<c:when test="${li.status=='정상' }">
								<td>
									<input type="button" value="환불" onclick="refund(${li.showTbId})">
								</td>
							</c:when>
							<c:otherwise>
								<td> </td>
							</c:otherwise>
						</c:choose>

						</tr>
					</c:forEach>
				</table>
				<div class="paging">
					<form action="merchantList" name="pageForm">
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
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>
</div>
<script>
	$(function(){
    	$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('page');
			console.log(value);
			document.pageForm.page.value = value;
			document.pageForm.submit();
		});
    });
	
	function refund(showTbId){
		
		if(confirm("대관신청을 환불하시겠습니까?")){
			location.href='/payment/rentalRefund/'+showTbId;	
		}
	}
	</script>
</body>
</html>
