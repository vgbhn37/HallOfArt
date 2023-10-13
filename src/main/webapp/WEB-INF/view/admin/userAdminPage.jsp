<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HallOfArt - UserAdmin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/admin_styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
  	<%@ include file="/WEB-INF/view/layout/admin_header.jsp"%>
    
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	

	<table width = "90%" border = "3" align="center">
	<div style="float: right; margin-right: 124">
	<caption id="cap-top">
		<form method="post" action="uSearchList">
			<input name="u_name" type="text" placeholder="이름이나 닉네임 입력">&nbsp;&nbsp;
			<input type="submit" value="검색">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</caption>
		</div>
		<div style="width: 450px; margin: 0 auto;">
				<tr align="center" class="main-table">
					<td>회원번호</td>
					<td>닉네임</td>
					<td>이름</td>
					<td>가입날짜</td>
					<td>역할</td>
					<td colspan="2">등&nbsp;&nbsp;급</td>
				</tr>
			<c:forEach items="${userList}" var = "dto" varStatus="status">
				<form method="post" action="modify">
						<tr align="center" class="${status.count % 2 == 0 ? 'users-table' : 'odd-row'}">
							<td>${dto.id}</td>
							<td>
								<a href="user_view?u_id=${dto.id}" onclick="window.open(this.href, '_blank', 'width=650, height=1500'); return false;">${dto.username}</a>
							</td>
							<td>${dto.username}</td>
							<td><fmt:formatDate value="${dto.regDate}" pattern="yyyy-MM-dd"/></td>
							<td>${dto.roleTypeId}</td>
							<td>
		                    <select name="u_role">
		                    	<c:choose>
		                    		<c:when test="${dto.roleTypeId==1}">
			                    	    <option value="ADMIN" selected>관리자</option>                  			
		                    		</c:when>
		                    		<c:when test="${dto.roleTypeId==2}">
			                    	    <option value="USER" selected>유저</option>                    			
		                    		</c:when>
		                    		<c:otherwise>		                    			
			                	        <option value="USER" selected>USER</option>		                    			
			                    	    <option value="ADMIN">ADMIN</option>
		                    		</c:otherwise>
		                    	</c:choose>
	            	        </select>
						</td>
						<td>
							<input type="hidden" name="u_id" value="${dto.id}">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<input type="hidden" name="url" value="uSearchList">
							<input type="submit" value="수정">
						</td>
					</tr>
				</form>
			</c:forEach>
	</div>
		<caption id="cap-bottom">
		<div class="user_page">
			<ul>
				<c:if test="${pageMaker.prev}">				
					<li class="paginate_button">
	<!-- 				시작페이지 -1 하면 이전의 10개 페이지 표시 -->
						<a href="${pageMaker.startPage-1}">
							[Prev]
						</a>
						&nbsp;
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	<%-- 			<li>${num}</li> --%>
	<%-- 			<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""}> --%>
	<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
					<li class="paginate_button">
	<!-- 				클릭한 현재 페이지 번호를 링크로 연결 -->
						<a href="${num}" ${pageMaker.cri.pageNum == num ? "style='font-weight: 900; font-size: larger; color:#FFC147;'":""}>
							[${num}]
						</a>
					</li>
					&nbsp;
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button">
	<!-- 				끝페이지 +1 하면 이후의 10개 페이지 표시 -->
						<a href="${pageMaker.endPage+1}">
							[Next]
						</a>
					</li>				
				</c:if>
			</ul>
		</div>
		</caption>
	</table>
		<form method="get" id="actionForm" action="#">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
<script>
	var actionForm = $("#actionForm");
// 	페이지 번호 처리	
	$(".paginate_button a").on("click", function(e){
// 		기본 동작 막음 : 페이지 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@@@@### href ===> "+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
// 	게시글 처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno = $(this).attr("href");
// 		console.log("move click~!!"));
// 		console.log("@# href ===>"$(this).attr("href"));

// 		게시글 클릭 후 뒤로가기 누를 때 &bid=번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='bid']").val();
		if (bno != ''){
			actionForm.find("input[name='bid']").remove();
		}
		
		actionForm.append("<input type='hidden' name='bid' value='"+targetBno+"'>")
		actionForm.attr("action","user_view").submit();
// 		"content_view?bid=${dto.bid}" 에 있는 ?bid= 의 bid와 name 을 매칭
	});
</script>


                    </div>
                </main>
                
		<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script>
        	$(document).ready(function(){
        		
        	});
        </script>
    </body>
</html>
