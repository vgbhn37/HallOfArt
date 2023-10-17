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
		alert("분류값을 선택하세요.");
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

//summernote
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: 'content',
		minHeight: 370,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR'
	});
});

// 공지사항 드롭다운 항목을 클릭했을 때 호출되는 함수
function selectItem(selectedItem) {
	let dropdownButton = document.querySelector('.dropdown-btn');
	dropdownButton.textContent = selectedItem;
	let classification = document.querySelector('#classification');
	classification.value = selectedItem;
}

//페이지네이션
$(function() {
	$('#pagination').on('click', 'a', function(e) {
		e.preventDefault();
		console.log($(this));
		const value = $(this).data('page');
		console.log(value);
		document.pageForm.page.value = value;
		document.pageForm.submit();
	});

})

//문의하기 유효성검사
function validationInquiry() {
	getCheckedValue();
	let form = document.querySelector("#form");
	let title = form.elements["title"].value;
	let classification = document.getElementById("classification").value;
	let content = form.elements["content"].value;

	if (!classification) {
		alert("분류 버튼을 선택하세요.");
		return false;
	}
	if (!title) {
		alert("제목을 입력하세요.");
		return false;
	}
	if (!content) {
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
}

function sendInquiry() {
	if (validationInquiry()) {
		document.querySelector("#form").submit();
	}
}

//분류값을 받아서 넘기기
function getCheckedValue() {
	var radios = document.querySelectorAll('input[type="radio"]');

	var selectedValue = null;
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			selectedValue = radios[i].value;
			break;
		}
	}

	if (selectedValue !== null) {
		document.querySelector('#classification').value = selectedValue;
	} else {
		//alert("분류 버튼을 선택하세요.");
	}
}