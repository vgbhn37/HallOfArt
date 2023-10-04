<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp" %>

	<h1>공지사항</h1>
		<table class="table">
		<thead>
			<tr>
				<th>분류</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="announcement" items="${announcementList}">
				<tr>
					<td><a href="#">${announcement.classification}</a></td>
					<td><a href="/customerservice/announcement/detail?page=${paging.page}&id=${announcement.id}">${announcement.title}</a></td>
					<td><a href="#">${announcement.createdAt}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="paging">
			<form action="<c:url value='/customerservice/announcement'/>" name="pageForm">
                       <div class="text-center clearfix">
                           <ul class="pagination" id="pagination">
                           	<c:if test="${pagination.prev}">
                               	<li class="page-item "><a  class="page-link" href="#" data-page="${pagination.beginPage-1}">Prev</a></li>
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
	<script>
	$(function() {
		$('.whyBtn').click(function() {
			location.href = '<c:url value="/FreeBoard/freeWrite"/>';
		})
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('page');
			console.log(value);
			document.pageForm.page.value = value;
			document.pageForm.submit();
		});
		
	})
	</script>
	<a href="/customerservice/announcement/write" class="btn btn-primary">글쓰기</a>
	
<%@include file="/WEB-INF/view/layout/footer.jsp" %>