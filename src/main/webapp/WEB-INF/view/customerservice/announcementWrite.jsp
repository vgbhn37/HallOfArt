<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
    
    .title--write {
	    position: relative;
	    color: #535353;
	    font-size: 35px;
	    line-height: 35px;
	    padding: 5px 0 20px 22px;
	    margin-bottom: 35px;
	}
	
	.title--write:before {
	    position: absolute;
	    top: 0;
	    left: 0;
	    display: block;
	    width: 12px;
	    height: 12px;
	    background: #ed1a3b;
	    content: "";
	}
    
    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        z-index: 1;
    }

    .dropdown-content a {
        padding: 12px 15px;
        text-decoration: none;
        display: block;
        cursor: pointer;
    }

    .dropdown:hover .dropdown-content {
    	display: block;
	}
	
	.dropdown-btn {
		display: inline-block;
	    padding: 5px 10px;
		border: 1px solid black;
	    background-color: #fff;
	    color: #151432;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	}
	
	.dropdown-btn:hover {
		background-color: #151432;
    	color: #fff;
	}
	
	#subBtn {
		margin-top: 40px;
		display: inline-block;
	    padding: 10px 20px;
		border: 1px solid black;
	    background-color: #fff;
	    color: #151432;
	    margin-bottom: 50px;
	    text-decoration: none !important;
	    transition: background-color 0.3s, color 0.3s;
	}
	
	#subBtn:hover {
	    background-color: #151432;
    	color: #fff;
	}
</style>

<body>

<div class= "container" style="margin-top: 70px;">
	<h1 class="title--write">공지 작성</h1>
	
    <form method="post" action="/customerservice/announcement/write" id="form" onsubmit="return false;">
        <div style="display: flex;">
            <input type="text" id="title" name="title" style="width: 94%;" placeholder="제목" />
            <div class="dropdown" style="margin-left: 10px;">
                <button class="dropdown-btn" type="button">분류</button>
                <div class="dropdown-content">
                    <a onclick="selectItem('대관')">대관</a>
                    <a onclick="selectItem('전시')">전시</a>
                    <a onclick="selectItem('회원')">회원</a>
                    <a onclick="selectItem('결제')">결제</a>
                </div>
            </div>
        </div>
        <br>
        <br>
        <textarea id="summernote" id="content" name="content"></textarea>
        <input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="send()" />
        <input type="hidden" id="classification" name="classification" />
    </form>
</div>



	<!-- 	<form action="/customerservice/announcement/write" method="post" onsubmit="return false;" id="form">
		<div class="mb-3">
		  <label for="title" class="form-label">title</label>
		  <input type="text" class="form-control" id="title" name="title">
		</div>
		<div class="mb-3">
		  <label for="classification" class="form-label">classification</label>
		  <input type="text" class="form-control" id="classification" name="classification">
		</div>
		<div class="mb-3">
		  <label for="content" class="form-label">content</label>
		  <textarea class="form-control" id="content" rows="8" name="content"></textarea>
		</div>
		<button type="button" class="btn btn-primary" onclick="send()">글쓰기</button>
	</form> -->

	<script>
		//유효성 검사
		function validationForm() {
			let form = document.querySelector("#form");
			let title = form.elements["title"].value;
			let classification = document.getElementById("classification").value;
			let content = form.elements["content"].value;
			
			if (!title) {
				alert("제목을 입력하세요.");
				return false;
			}
			if (!classification) {
				alert("분류값을 입력하세요.");
				return false;
			}
			if (!content) {
				alert("내용을 입력하세요.");
				return false;
			}
			return true;
		}
		function send() {
			if (validationForm()) {
				document.querySelector("#form").submit();
			}
		}

		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder : 'content',
				minHeight : 370,
				maxHeight : null,
				focus : true,
				lang : 'ko-KR'
			});
		});

		// 드롭다운 항목을 클릭했을 때 호출되는 함수
		function selectItem(selectedItem) {
        	let dropdownButton = document.querySelector('.dropdown-btn'); // 드롭다운 버튼 요소 가져오기
        	dropdownButton.textContent = selectedItem;
        	let classification = document.querySelector('#classification');
        	classification.value = selectedItem;
    	}
	</script>
</body>
</html>