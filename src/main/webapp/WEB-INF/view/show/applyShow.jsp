<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	include file="../layout/header.jsp" %>
<!-- --------------------------------------------------------- -->	
<link href="/resources/css/showApply.css" rel="stylesheet" />
<!-- --------------------------------------------------------- -->
	<div class="content">
		<form method="post" id="apply_frm" action="apply" style="width:100%">
  			<table class="insertShowTb">
  				<tr>
    				<td colspan="2">
    					<br><h1>대관 신청 - ${name}</h1><br><br>
    				</td>
    			</tr>
    			<tr>
					<td colspan="2"  style="text-align: center;">
						<h3>
							대관 정보
							<c:forEach var="hall" items="${halls}">
								<c:if test="${hall.name eq name}">
									<input type="hidden" name="hallTbId" value="${hall.id}">
									<input type="hidden" name="name" value="${hall.name}">
									<input type="hidden" id="showImg" name="showImg">
								</c:if>
							</c:forEach>
						</h3>
					</td>
				</tr>
       			<tr>
       				<td rowspan="2" style="width: 40%; min-width: 150px;">대관 날짜</td>
       				<td>
       					Start :&nbsp;<input type="text" class="datepicker" id="datepicker1" name="startDate" autocomplete="off" style="width: 200px;" readonly="readonly">
       					<button type="button" id="date1resetBtn">reset</button>
   					</td>
       			</tr>
       			<tr>
       				<td>
       					End :&nbsp;&nbsp;<input type="text" class="datepicker" id="datepicker2" name="endDate" autocomplete="off" style="width: 200px;" readonly="readonly">
       					<button type="button" id="date2resetBtn">reset</button>
       					<input type="hidden" id="amount" name="amount">
       				</td>
       			</tr>
       			<tr>
       				<td rowspan="2">대관료</td>
       				<td id="hallInfoTd">
       				</td>
       			</tr>
       			<tr>
       				<td style="color: #bbb">
       					${hallInfo.name} - 기본 대관 가격 : 
       					<fmt:formatNumber value="${hallInfo.basicPrice}" pattern="#,###" /> 원 , 
       					1일 당 <fmt:formatNumber value="${hallInfo.perTimePrice}" pattern="#,###" /> 원 추가
       				</td>
       			</tr>
    			<tr>
    				<td colspan="2">
       					<br>
       					<c:choose>
       						<c:when test="${hallInfo.hallTypeId == 1 }"><h3>공연 정보</h3></c:when>
       						<c:when test="${hallInfo.hallTypeId == 2 }"><h3>전시 정보</h3></c:when>
       					</c:choose>
       					
       					
       					<c:choose>
							<c:when test="${empty user}">
								<input type="hidden" id="userTbIdd" value="">
							</c:when>
							<c:otherwise>
								<input type="hidden" name="userTbId" value="${user.id}">
								<input type="hidden" name="showTbId" value="1">
							</c:otherwise>
						</c:choose>
    				</td>
    			</tr>
       			<tr>
       				<td>공연/전시 제목</td>
       				<td><input type="text" name="title">
       				<input type="hidden" name="showTypeId1" value="${hallInfo.hallTypeId}"></td>
       			</tr>
       			<tr>
       				<td>공연/전시 내용</td>
       				<td><textarea name="content"></textarea></td>
       			</tr>
       			<tr>
       				<td>공연/전시 시간</td>
       				<td>
       					<div id="showtime_div">
	       					<input type="time" min="09:00" max="18:00" class="showTime" name="showStartTime" style="width:135px;">
	       					~
	       					<input type="time" min="09:00" max="18:00" class="showTime" name="showEndTime" style="width:135px;">
	       					<input type="hidden" name="startTime">
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
   			</table>
   		</form>
   		<form method="post" id="upload" action="upload" onsubmit="return false;" style="width:100%" enctype="multipart/form-data">
			<table class="insertShowTb">
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
	   				<td id="thumbTd" style="padding: 10px;">
	   				</td>
	   			</tr>
			</table>
		</form>
		<a id="booking" href="#">신청하기</a><br><br>
	</div>
<!-- --------------------------------------------------------- -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        beforeShowDay: disableDates
    });
	
	$("#datepicker1").datepicker('option', 'minDate', new Date());
	$("#datepicker2").datepicker('option', 'minDate', new Date());
	
	// datepicker 범위 제약 옵션
	$('#datepicker1').datepicker('option', 'onSelect', function(dateString){
    	$("#datepicker2").datepicker('option', 'minDate', dateString);
    	for (let li of ${rentalList}) {
			if(dateString<li){
		    	$("#datepicker2").datepicker('option', 'maxDate', li);
    			break;
			}
		}
    	if($("#datepicker2").val().length!=0){
    		amount = ${hallInfo.basicPrice}+(new Date($("#datepicker2").val()) - new Date($("#datepicker1").val()) )/(1000*60*60*24)*${hallInfo.perTimePrice};
    		$("#hallInfoTd").html(amount.toLocaleString('ko-KR') + " 원");
    		$("#amount").val(amount);
    	}
    });
	$('#date1resetBtn').on('click', function(){
    	$("#datepicker1").val('');
    	$("#datepicker2").datepicker('option', 'minDate', new Date());
    	$("#datepicker2").datepicker('option', 'maxDate', '');
	});
    $('#datepicker2').datepicker('option', 'onSelect', function(dateString){
    	$("#datepicker1").datepicker('option', 'maxDate', dateString);
    	for (let li of ${rentalList}.reverse()) {
			if(dateString>li){
		    	$("#datepicker1").datepicker('option', 'minDate', li);
    			break;
			}
		}
    	if($("#datepicker1").val().length!=0){
    		amount = ${hallInfo.basicPrice}+(new Date($("#datepicker2").val()) - new Date($("#datepicker1").val()) )/(1000*60*60*24)*${hallInfo.perTimePrice};
    		$("#hallInfoTd").html(amount.toLocaleString('ko-KR') + " 원");
    		$("#amount").val(amount);
    	}
    });
	$('#date2resetBtn').on('click', function(){
    	$("#datepicker2").val('');
    	$("#datepicker1").datepicker('option', 'minDate', new Date());
    	$("#datepicker1").datepicker('option', 'maxDate', '');
	});		

//		datepicker 특정 일 비활성화
    function disableDates(date){
//         console.log("rentalList fnc : "+${rentalList});
		var m = date.getMonth() + 1;
        var d = date.getDate();
        var y = date.getFullYear();
        for (var i = 0; i < ${rentalList}.length; i++) {
            var parts = ${rentalList}[i].split('-');
            var rentalYear = parseInt(parts[0]);
            var rentalMonth = parseInt(parts[1]);
            var rentalDay = parseInt(parts[2]);
            if (y === rentalYear && m === rentalMonth && d === rentalDay) {
                return [false];
            }
        }
        return [true];
    }
    
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
	
//  --------------------- 유효성 검사 ------------------------
	$("#booking").on("click", function(){
		let checkMsg = '';
		$("input").css("border", "1px solid #999");
		$("select").css("border", "1px solid #999");
		$("textarea").css("border", "1px solid #999");
		// ---------------- 유효성 : 이미지 파일
		if($("#uploadImg").val().length==0){
			$("#uploadImg").css("border", "2px solid red");
			checkMsg+="이미지를 업로드해주세요\n";
		}
		// ---------------- 유효성 : 유형
		if($("input[name=showTypeId1]").val()==null){
			$("input[name=showTypeId1").css("border", "2px solid red");
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
		if($("input[name=hallTbId]").val()==null){
			checkMsg+="대관할 홀 번호를 입력해주세요\n";
		}

		// startTime 계산
		$("input[name=startTime]").val($("input[name=startDate]").val()+" "+$("input[name=showStartTime]").val());
		
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
    
//  ---------------------이미지 업로드------------------------
	let uploadImg = null;
	$("#uploadImg").on("change", function(e){
		uploadImg = e.target.files[0];
		console.log(uploadImg);
	});
	$("#thumbTr").hide();
	$("#uploadImgBtn").on("click", function(){
		let formData = new FormData();
//			alert($("#uploadImg").val());

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
					thumb.style.width = "400px";
					thumb.style.height = "500px";
					thumb.style.border = "10px solid #eee";
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
<!-- --------------------------------------------------------- -->
<%@ include file="../layout/footer.jsp" %>