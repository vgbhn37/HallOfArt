<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>
	body{
		margin: 0; padding: 2px;
		background-color: #444;
	}
	.nav{
		background-color: #444;
		width: 100%;
		height: 100px;
	}
	
	.banner{
		width: 85%;
		height: 220px;
		margin: auto;
		padding: 0 40px;
		background-image: url("http://picsum.photos/2000/400");
	}
	
	.content{
		width: 85%;
		min-height: 800px;
		padding: 0 40px;
		margin: auto;
		background-color: white;
		box-shadow: inset 0px 5px 10px 0px rgba(128, 128, 128, 0.3);
		display: flex;
		flex-direction: column;
		overflow: hidden;
	}
	#list_tb{
		border: 1px solid grey;
		width: 480px;
		margin: auto;
		margin-top: 100px;
		text-align: center;
	}
	#list_tb td{
		height: 50px;
	}
	.footer{
		background-color: #999;
		width: 100%;
		height: 180px;
	}
	textarea{
		width: 300px;
		height: 150px;
		resize: none;
		border: 1px solid #999;
	}
	input, select{
		width: 300px;
		border-radius: 0px;
		border: 1px solid #999;
		height: 75%;
	}
	.insertShowTb{
		max-width: 800px;
		width: 80%;
		text-align: center;
		margin: auto;
	}
	.insertShowTb td{
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
	#halltimeTd{
/* 		text-align: center; */
		width: 100%; 
		height: 100%;
		margin: auto;
		margin-top: 8px;
	}
	#showImg{
		width: 250px;
	}
</style>

<script>
	
</script>

</head>
<body>
	<div class="nav">
		<button type="button">메뉴</button>
		<button type="button">로그인</button>
		<button type="button">회원가입</button>
	</div>
	<div class="banner">
		
	</div>
<%@ include file="/WEB-INF/view/layout/mid_menu.jsp"%>
	
	<div class="content">
		<form method="post" id="upload" action="upload" onsubmit="return false;" style="width:100%" enctype="multipart/form-data">
			<table class="insertShowTb" style="margin-top: 50px;">
    			<tr>
    				<td colspan="2">
       					<h3>공연 정보</h3>
    				</td>
    			</tr>
	   			<tr>
	   				<td style="width: 40%; min-width: 150px;">공연/전시 이미지</td>
	   				<td>
	   					<label for="uploadImg">
	   						<input type="file" id="uploadImg" name="uploadImg" accept="image/*" multiple="multiple" style="width: 250px">
	   						<button id="uploadImgBtn" style="width:50px;">저장</button>
		   				</label>
   					</td>
	   			</tr>
	   			<tr id="thumbTr">
	   				<td>미리보기</td>
	   				<td id="thumbTd" style="height: 300px; padding: 10px; background-color: #eee">
	   				</td>
	   			</tr>
			</table>
		</form>
		<form method="post" id="apply_frm" action="apply" style="width:100%">
  			<table class="insertShowTb">
  				<tr>
  					<td>신청인</td>
  					<td>
  						<c:choose>
							<c:when test="${empty user}">
								비로그인
								<input type="hidden" id="userTbIdd" value="">
							</c:when>
							<c:otherwise>
								id : <c:out value="${user.id}"></c:out>
								<input type="hidden" name="userTbId" value="${user.id}">
								<input type="hidden" name="showTbId" value="1">
							</c:otherwise>
						</c:choose>
  					</td>
  				</tr>
       			<tr>
       				<td style="width: 40%; min-width: 150px;">공연/전시 유형</td>
       				<td>
       					<select name="showTypeId1">
       						<option value="" selected disabled>- - - - - - -</option>
       						<option value="1">1 : 공연</option>
       						<option value="2">2 : 전시</option>
       					</select>
       					<input type="hidden" id="showImg" name="showImg">
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
       				<td>시작 날짜</td>
       				<td><input type="text" class="datepicker" id="datepicker1" name="startDate" autocomplete="off"></td>
       			</tr>
       			<tr>
       				<td>종료 날짜</td>
       				<td><input type="text" class="datepicker" id="datepicker2" name="endDate" autocomplete="off"></td>
       			</tr>
       			<tr>
       				<td>공연/전시 시간</td>
       				<td>
       					<div id="showtime_div">
	       					<input type="time" min="09:00" max="18:00" class="showTime" name="showStartTime" style="width:135px;">
	       					~
	       					<input type="time" min="09:00" max="18:00" class="showTime" name="showEndTime" style="width:135px;">
       					</div>
       				</td>
       			</tr>
       			<tr><td style="height:20px"></td>
       				<td style="height:20px; padding-bottom: 5px;"><span style="color: #bbb">※ 본 관은 오전 9:00 부터 오후 6:00 까지 운영합니다</span></td>
       			</tr>
       			<tr>
       				<td>입장 가격</td>
       				<td><input type="text" name="price"></td>
       			</tr>
				<tr>
					<td colspan="2"  style="text-align: center;">
						<h3>대관 정보</h3>
					</td>
				</tr>
       			<tr>
       				<td>장소 (홀)</td>
       				<td>
       					<select name="hallTbId">
       					    <option value="" selected disabled>- - - - - - -</option>
       						<c:forEach var="hall" items="${halls}">
       							<c:choose>
       								<c:when test="${hall.status eq '사용 중'}">
		       							<option value="${hall.id}" disabled>
       								</c:when>
       								<c:otherwise>
		       							<option value="${hall.id}">
       								</c:otherwise>
       							</c:choose>
       								${hall.id} - ${hall.name} : ${hall.status}
   								</option>
       						</c:forEach>
       					</select>
       				</td>
       			</tr>
       			<tr>
       				<td>대관 시간</td>
       				<td>
       					<div id="halltimeTd">
	       					<select name="rentalStartTime" style="width:140px;">
	       					    <option value="" selected disabled>- - - - -</option>
	       						<option value="09:00">09:00</option>
	       						<option value="10:00">10:00</option>
	       						<option value="11:00">11:00</option>
	       						<option value="12:00">12:00</option>
	       						<option value="13:00">13:00</option>
	       					</select>
	       					~
	       					<select name="rentalEndTime" style="width:140px;">
	       					    <option value="" selected disabled>- - - - -</option>
	       						<option value="12:00">14:00</option>
	       						<option value="15:00">15:00</option>
	       						<option value="16:00">16:00</option>
	       						<option value="17:00">17:00</option>
	       						<option value="18:00">18:00</option>
	       					</select>
       					</div>
       				</td>
       			</tr>
       			<tr>
       				<td colspan="2"><a id="booking" href="#">신청하기</a></td>
       			</tr>
   			</table>
   		</form>
	</div>
	<%@ include file="../layout/footer.jsp" %>
	<script>
	$(document).ready(function() {
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
		
//      --------------------- 유효성 검사 ------------------------
		$("#booking").on("click", function(){
			let checkMsg = '';
			$("input").css("border", "1px solid #999");
			$("select").css("border", "1px solid #999");
			$("textarea").css("border", "1px solid #999");
			// ---------------- 유효성 : 이미지 파일
			if($("#showImg").val().length==0){
				$("#uploadImg").css("border", "2px solid red");
				checkMsg+="이미지를 업로드해주세요\n";
			}
			// ---------------- 유효성 : 유형
			if($("select[name=showTypeId1]").val()==null){
				$("select[name=showTypeId1").css("border", "2px solid red");
				checkMsg+="대관 유형을 입력해주세요 (공연 / 전시)\n";
			}
			// ---------------- 유효성 : 제목
			if($("input[name=title]").val().trim().length==0){
				$("input[name=title").css("border", "2px solid red");
				checkMsg+="제목을 입력해주세요\n";
			}
			// ---------------- 유효성 : 내용
			if($("textarea[name=content]").val().trim().length==0){
				$("textarea[name=content").css("border", "2px solid red");
				checkMsg+="내용을 입력해주세요\n";
			}
			// ---------------- 유효성 : 날짜
			let pattern = /^\d{4}-\d{2}-\d{2}$/;
			if($("input[name=startDate]").val().length==0){
				$("input[name=startDate]").css("border", "2px solid red");
				checkMsg+="시작 날짜를 입력해주세요\n";
			}else if(!pattern.test($("input[name=startDate]").val())){
				$("input[name=startDate]").css("border", "2px solid red");
				checkMsg+="시작 날짜의 형식이 맞지 않습니다 (yyyy-mm-dd)\n";
			}
			if($("input[name=endDate]").val().length==0){
				$("input[name=endDate]").css("border", "2px solid red");
				checkMsg+="종료 날짜를 입력해주세요\n";
			}else if(!pattern.test($("input[name=endDate]").val())){
				$("input[name=endDate]").css("border", "2px solid red");
				checkMsg+="종료 날짜의 형식이 맞지 않습니다 (yyyy-mm-dd)\n";
			}
			// ---------------- 유효성 : 시간
			if($("input[name=showStartTime]").val().length==0||$("input[name=showEndTime]").val().length==0){
				$("input[name=showStartTime]").css("border", "2px solid red");
				$("input[name=showEndTime]").css("border", "2px solid red");
				checkMsg+="시작 시간과 종료 시간을 입력해주세요\n";
			}else if($("input[name=showStartTime]").val()>$("input[name=showEndTime]").val()){
				$("input[name=showStartTime]").css("border", "2px solid red");
				$("input[name=showEndTime]").css("border", "2px solid red");
				checkMsg+="시작 시간과 종료 시간이 적합하지 않습니다\n";
			}
			if($("input[name=showStartTime]").val()<"09:00"){
				$("input[name=showStartTime]").css("border", "2px solid red");
				checkMsg+="본 관의 운영 시간은 오전 09:00 부터 오후 18:00 까지 입니다\n";
			}else if($("input[name=showEndTime]").val()>"18:00"){
				$("input[name=showEndTime]").css("border", "2px solid red");
				checkMsg+="본 관의 운영 시간은 오전 09:00 부터 오후 18:00 까지 입니다\n";
			}
			// ---------------- 유효성 : 가격
			if($("input[name=price]").val().length==0){
				$("input[name=price]").css("border", "2px solid red");
				checkMsg+="입장 가격을 입력해주세요\n";
			}
			// ---------------- 유효성 : 장소
			if($("select[name=hallTbId]").val()==null){
				$("select[name=hallTbId]").css("border", "2px solid red");
				checkMsg+="대관할 홀 번호를 입력해주세요\n";
			}
			// ---------------- 유효성 : 대관 시간
			if($("select[name=rentalStartTime]").val()==null||$("select[name=rentalEndTime]").val()==null){
				$("select[name=rentalStartTime]").css("border", "2px solid red");
				$("select[name=rentalEndTime]").css("border", "2px solid red");
				checkMsg+="대관 시간을 입력해주세요\n";
			}
			
			// ---------------- 유효성 최종 확인
			if(checkMsg.length!=0){
				alert(checkMsg);				
			}else{
				if(confirm("위 내용으로 대관을 신청하시겠습니까?")){
		 			$("#apply_frm").submit();
				}
			}
		});
		
        $(".showTime").on("input", function() {
            var inputValue = this.value;

            var minTime = "09:00";
            var maxTime = "18:00";

            if (inputValue < minTime || inputValue > maxTime) {
                this.style.border = "2px solid red";
            } else {
                this.style.border = "";
            }
        });
        
//      ---------------------이미지 업로드------------------------
		let uploadImg = null;
		$("#uploadImg").on("change", function(e){
			uploadImg = e.target.files[0];
			console.log(uploadImg);
		});
		$("#thumbTr").hide();
		$("#uploadImgBtn").on("click", function(){
			let formData = new FormData();
			alert($("#uploadImg").val());
			if($("#uploadImg").val().length!=0){
				formData.append('uploadImg', uploadImg);
				console.log("formData : "+formData);
				
				$.ajax({
					url: "upload",
					type: "post",
					data: formData,
					processData: false,
					contentType: false,
					success: function(data){
						console.log("업로드 성공 : "+data);
						let thumb = document.createElement("img");
						thumb.src = "/imagePath/"+data;
						thumb.style.width = "100%";
						thumb.style.height = "100%";
						$("#thumbTd").empty();
						$("#thumbTd").append(thumb);
						$("#thumbTr").show();
						$("#showImg").val(data);
					},
					error: function(e){
						console.log("error : "+e);
					}
				});// end of ajax
			}else{
				alert("이미지가 선택되지 않았습니다");
			}
		})
	});
	</script>
</body>
</html>