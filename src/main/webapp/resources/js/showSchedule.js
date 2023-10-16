// -------------------------- jquery
$(document).ready(function(){
	$("#dateSearchBtn").on("click", function(){
		let pattern = /^\d{4}-\d{2}-\d{2}$/;
		if($("#datepicker").val().length==0){
			alert("날짜를 입력해주세요");
		}else if(!pattern.test($("#datepicker").val())){
			alert("시작 날짜의 형식이 맞지 않습니다 (yyyy-mm-dd)\n");
		}else{
			location.href="schedule?date="+$("#datepicker").val();
		}
	});
	// ----------------------- datepicker
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
    $('#datepicker1').datepicker('option', 'onSelect', function(dateString){
    	$("#start_date").html(dateString);
    	startDate = dateString;
    	$("#datepicker2").datepicker('option', 'minDate', dateString);
	   	findByDateAjax(startDate, endDate);
    });
    $('#datepicker2').datepicker('option', 'onSelect', function(dateString){
    	$("#end_date").html(dateString);
    	endDate = dateString;
    	$("#datepicker1").datepicker('option', 'maxDate', dateString);
	   	findByDateAjax(startDate, endDate);
    });
    
	// ----------------------- 반응형 웹 적용
    $(window).resize(function() {
        // 현재 윈도우의 너비를 가져옴
        var windowWidth = $(window).width();

        if (windowWidth <= 1000) {
            $(".list_tb").css("width", "90%");
        } else {
            $(".list_tb").css("width", "900px");
        }
    });
    $(window).trigger("resize");
})