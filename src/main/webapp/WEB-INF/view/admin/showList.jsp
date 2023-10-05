<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/admin_styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
	.insertShow_content{
		width: 100%;
		min-height: 800px;
		border: 1px solid black;
	}
	#showList{
		border: 1px solid grey;
		margin: auto;
		margin-top: 50px;
		max-width: 1000px;
		width: 90%;
		text-align: center;
	}
	.contentTr{
		text-align: left;
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
                   				<td style="width:10%">no.</td>
                   				<td style="width:10%">유형</td>
                   				<td style="width:25%">제목</td>
                   				<td style="width:25%">날짜</td>
                   				<td style="width:25%">상태</td>
                   			</tr>
                   			<c:forEach var="li" items="${list}">
                   				<tr>
                   					<td>${li.id}</td>
                   					<td>${li.showTypeId1}</td>
                   					<td class="titleTd">${li.title}</td>
                   					<td>${li.startDate} ~ ${li.endDate}</td>
                   					<td>
                   						<input type="hidden" id="statusId" value="${li.id}">
                   						<select id="selectStatus" required>
                   							<option value="none" selected disabled>${li.showStatus}</option>
                   							<option value="승인 요청">승인 요청</option>
                   							<option value="결제 요청">승인 (결제 요청)</option>
                   							<option value="결제됨">결제됨</option>
                   							<option value="취소">취소</option>
                   						</select>
                   						<button id="statusBtn">확인</button>
               						</td>
                   				</tr>
                   				<tr class="contentTr">
                   					<td style="text-align: center;">내용</td>
                   					<td colspan="4" style="padding: 10px;">${li.content}</td>
                   				</tr>
                   			</c:forEach>
                   		</table>
                    </div>
                </div>
            </main>
<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>
        </div>
    </div>
	<script>
	    var button = document.getElementById('statusBtn');
	    var select = document.getElementById('selectStatus');
	
	    button.addEventListener('click', function() {
	        var td = button.parentElement;
	        var tdSelect = td.querySelector('select');
	        var tdId = td.querySelector('#statusId');
// 	        alert('updateStatus?id='+tdId.value+'&showStatus=' + tdSelect.value);
			location.href="updateStatus?id="+tdId.value+"&showStatus="+tdSelect.value;
	    });
	    $(function(){
	    	$(".contentTr").hide();
	    	$(".titleTd").on("click", function(){
	    		let content = $(this).parent().next(".contentTr");
	    		content.toggle();
	    	});
	    });
	</script>
</body>
</html>
