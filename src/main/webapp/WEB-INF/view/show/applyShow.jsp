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
			let formData = $("#apply_frm").serializeArray();
			let alertText = '';
			formData.forEach(function(input) {
			    alertText += input.name + ": " + input.value + "\n";
			});
// 			alert(alertText);
			$("#apply_frm").submit();
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
	});
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
       				<td style="width: 40%; min-width: 150px;">공연/전시 유형</td>
       				<td>
       					<select name="showTypeId1">
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
       				<td><input type="text" class="datepicker" id="datepicker1" name="startDate"></td>
       			</tr>
       			<tr>
       				<td>종료 날짜</td>
       				<td><input type="text" class="datepicker" id="datepicker2" name="endDate"></td>
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
       						<option value="0">0관 - 401호</option>
       						<option value="1">1관 - 402호</option>
       						<option value="2">2관 - 403호</option>
       					</select>
       				</td>
       			</tr>
       			<tr>
       				<td>대관 시간</td>
       				<td>
       					<div id="halltimeTd">
	       					<select name="hallStartTime" style="width:140px;">
	       						<option value="9">09:00</option>
	       						<option value="10">10:00</option>
	       						<option value="11">11:00</option>
	       						<option value="12">12:00</option>
	       					</select>
	       					~
	       					<select name="hallEndTime" style="width:140px;">
	       						<option value="15">15:00</option>
	       						<option value="16">16:00</option>
	       						<option value="17">17:00</option>
	       						<option value="18">18:00</option>
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
	$(document).ready(function(){
		let uploadImg = null;
		$("#uploadImg").on("change", function(e){
			uploadImg = e.target.files[0];
			console.log(uploadImg);
		});
		$("#thumbTr").hide();
		$("#uploadImgBtn").on("click", function(){
			let formData = new FormData();
			if(showImg!=null){
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
						$("#thumbTd").append(thumb);
						$("#thumbTr").show();
						$("#showImg").val(data);
					},
					error: function(e){
						console.log("error : "+e);
					}
				});// end of ajax
			}else{
				alert("showImg is null");
			}
		})
	});
	</script>
</body>
</html>