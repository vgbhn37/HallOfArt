<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
	.mid_menu{
 		background-color: white;
		width: 85%;
		height: 70px;
		margin: auto;
		padding: 0 40px;
		display: flex;
	}
	.mid1, .mid2, .mid3{
		height: 100%;
		text-align: center;
		border-right: 1px solid rgba(120,120,120,0.3);
	}
	.mid1{
		flex:0 0 70px;
		border-left: 1px solid rgba(120,120,120,0.3);
	}
	.mid2, .mid3{
		flex:0 0 220px;
	}
	.mid_a{
		text-decoration: none;
		color: black;
		font-size: 1.5em;
/* 		font-weight: bold; */
		display: inline-block;
		vertical-align: middle;
		height: 70px;
		line-height: 70px;
	}
	.mid_ul{
		display: block;
		border: 1px solid rgba(120,120,120,0.3);
		border-top: none;
		background-color: white;
		padding: 20px;
 		width: 179px;
		margin: 0;
		list-style: none;
		display: none;
		position: absolute;
		z-index: 999;
	}
	.mid_ul li{
		height: 28px;
	}
<<<<<<< HEAD
	a{
		text-decoration: none;
		color: black;
	}
=======
>>>>>>> eadd2e2d323580e4cc646bd6e11aaeff64027280
</style>
<script>
$(function() {

	$(".mid2").mouseenter(function(){
			$("#ul_show").stop().slideDown(400);
		});
		$(".mid2").mouseleave(function(){
		$("#ul_show").stop().slideUp(200);
		});
	$(".mid3").mouseenter(function(){
			$("#ul_detail").stop().slideDown(400);
		});
		$(".mid3").mouseleave(function(){
		$("#ul_detail").stop().slideUp(200);
	});
});
</script>
</head>
<body>
<div class="mid_menu">
	<div class="mid1">
		<a class="mid_a" id="a_home" >HOME</a>
	</div>
	<div class="mid2">
		<a class="mid_a" id="a_show" >공연 / 전시</a>
		<ul class="mid_ul" id="ul_show">
<<<<<<< HEAD
			<li><a href="/show/schedule">공연 일정 조회</a></li>
=======
			<li>공연전시1</li>
>>>>>>> eadd2e2d323580e4cc646bd6e11aaeff64027280
			<li>공연전시2</li>
			<li>공연전시3</li>
			<li>공연전시4</li>
			<li>공연전시5</li>
		</ul>
	</div>
	<div class="mid3">
		<a class="mid_a" id="a_detail" >상세 정보</a>
		<ul class="mid_ul" id="ul_detail">
			<li>상세정보1</li>
			<li>상세정보2</li>
			<li>상세정보3</li>
			<li>상세정보4</li>
			<li>상세정보5</li>
		</ul>
	</div>
</div>
</body>
</html>