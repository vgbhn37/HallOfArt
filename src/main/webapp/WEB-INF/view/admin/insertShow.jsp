<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	textarea{
		width: 300px;
		height: 150px;
		resize: none;
	}
	input, select{
		width: 300px;
	}
	#insertShowTb{
		margin: auto;
		margin-top: 50px;
	}
	#insertShowTb td{
 		height: 35px;
		padding: 0px 10px;
	}
	#booking{
		display: block;
		background-color: white;
		border: 1px solid lightblue;
		width: 200px; height: 60px;
		text-align: center;
		border-radius: 10px;
		font-size: 30px;
		padding-top: 7px;
		margin: auto;
		margin-top: 30px;
		text-decoration: none;
		color: black;
	}
</style>
<script>
	$( function() {
		// datepicker 기본 설정
    	$(".datepicker").datepicker({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년',
        });
		// datepicker 범위 제약 옵션
		$('#datepicker1').datepicker('option', 'onSelect', function(dateString){
	    	$("#datepicker2").datepicker('option', 'minDate', dateString);
	    });
	    $('#datepicker2').datepicker('option', 'onSelect', function(dateString){
	    	$("#datepicker1").datepicker('option', 'maxDate', dateString);
	    });
		
		// 게시하기 버튼 애니메이션
    	$("#booking").hover(
   			function(){
   				$("#booking").stop().animate({
   					backgroundColor: "#cef"
   				}, 300 );
   			},
   			function(){
   				$("#booking").stop().animate({
   					backgroundColor: "#fff"
   				}, 300 );			
   			}
    	);
		$("#booking").on("click", function(){
			if($("#show_img").val().length==0){
				alert("image file : null");
			}else{
				alert("image file : not null");
			}
		});
	});
</script>
</head>
<%@ include file="/WEB-INF/view/layout/admin_header.jsp"%>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">공연/전시 정보 입력</h1>
                    <div class="insertShow_content">
                    	<form action="#">
                    		<table id="insertShowTb">
                    			<tr>
                    				<td>공연/전시 유형</td>
                    				<td>
                    					<select name="show_type_id1">
                    						<option value="0">0 : 공연</option>
                    						<option value="1">1 : 전시</option>
                    					</select>
                 					</td>
                    			</tr>
                    			<tr>
                    				<td>공연/전시 제목</td>
                    				<td><input type="text" name="title"></td>
                    			</tr>
                    			<tr>
                    				<td>공연/전시 내용</td>
                    				<td><textarea name="content"></textarea></td>
                    			</tr>
                    			<tr>
                    				<td>공연/전시 이미지</td>
                    				<td><input type="file" id="show_img" name="show_img"></td>
                    			</tr>
                    			<tr>
                    				<td>시작 날짜</td>
                    				<td><input type="text" class="datepicker" id="datepicker1" name="start_date"></td>
                    			</tr>
                    			<tr>
                    				<td>종료 날짜</td>
                    				<td><input type="text" class="datepicker" id="datepicker2" name="end_date"></td>
                    			</tr>
                    			<tr>
                    				<td>가격</td>
                    				<td><input type="text" name="price"></td>
                    			</tr>
                    			<tr>
                    				<td>상태 정보</td>
                    				<td>
                    					<select name="show_status">
                    						<option value="준비 중">준비 중</option>
                    						<option value="진행 중">진행 중</option>
                    						<option value="종료">종료</option>
                    					</select>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td>장소 (홀)</td>
                    				<td>
                    					<select name="hall_tb_id">
                    						<option value="0">0관 - 401호</option>
                    						<option value="1">1관 - 402호</option>
                    						<option value="2">2관 - 403호</option>
                    					</select>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td colspan="2"><a id="booking" href="#">게시하기</a></td>
                    			</tr>
                    		</table>
                    	</form>
                    </div>
                   
                </div>
            </main>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>
        </div>
    </div>
</body>
</html>
