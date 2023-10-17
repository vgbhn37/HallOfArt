//페이지네이션 + ajax로 공지사항 분류별 호출
$(document).ready(function() {

	setupPaginationEventHandlers();

	loadAnnouncements("전체");
	$('.tab--announcement li').click(function() {

		var classification = $(this).data('classification');

		$('.tab--announcement li').removeClass('active');
		$(this).addClass('active');

		loadAnnouncements(classification);
	});

	function setupPaginationEventHandlers() {
		$(document).on('click', '.pagination li a', function(e) {
			e.preventDefault();
			const value = $(this).data('page');
			// 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
			loadAnnouncements($('.tab--announcement li.active').data('classification'), value);
		});
	}

	function loadAnnouncements(classification, page) {
		$.ajax({
			type: 'GET',
			url: '/customerservice/announcement/classification',
			data: { classification: classification, page: page }, // 페이지 번호와 카테고리 정보를 전달합니다.
			success: function(data) {
				var announcementList = data.announcementList;
				var pagination = data.pagination;
				var announcementListHTML = "";
				for (var i = 0; i < announcementList.length; i++) {
					var announcement = announcementList[i];
					var formattedDate = formatDate(announcement.createdAt); // 날짜 포맷 변환
					announcementListHTML += '<tr>' +
						'<td><p class="classification">' + announcement.classification + '</p></td>' +
						'<td><a href="/customerservice/announcement/detail?page=' + pagination.paging.page + '&id=' + announcement.id + '">' + announcement.title + '</a></td>' +
						'<td><p>' + formattedDate + '</p></td>' +
						'</tr>';
				}
				var paginationHTML = '';
				if (pagination.prev) {
					paginationHTML += '<li class="page-item"><a class="page-list" href="#" data-page="' + (pagination.beginPage - 1) + '">Prev</a></li>';
				}
				for (var num = pagination.beginPage; num <= pagination.endPage; num++) {
					paginationHTML += '<li class="' + (pagination.paging.page == num ? 'page-item active' : 'page-item') + '"><a class="page-list" href="#" data-page="' + num + '">' + num + '</a></li>';
				}
				if (pagination.next) {
					paginationHTML += '<li class="page-item"><a class="page-list" href="#" data-page="' + (pagination.endPage + 1) + '">Next</a></li>';
				}
				$('#announcement-list-container').html(announcementListHTML);
				$('#pagination').html(paginationHTML);
			},
			error: function(error) {
				console.error('오류 발생:', error);
			}
		});
	}
});

//날짜 포멧
function formatDate(timestamp) {
	const date = new Date(timestamp);
	return date.toLocaleDateString();
}

//공지사항 유효성 검사
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

//네이버 지도 api
var map = new naver.maps.Map('map', {
	center: new naver.maps.LatLng(35.1596175, 129.06022),
	zoom: 18
});

var map = new naver.maps.Map(document.getElementById('map'), {
	center: new naver.maps.LatLng(35.1596175, 129.06022),
	zoom: 18
});
//마커
var marker = new naver.maps.Marker({
	position: new naver.maps.LatLng(35.1596175, 129.06022),
	map: map
});


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

//답변 유효성 검사
function validationInquiryDetail() {
	let form = document.querySelector("#aForm");
	let title = form.elements["title"].value;
	let content = form.elements["content"].value;

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

function sendDetail() {
	if (validationInquiryDetail()) {
		document.querySelector("#aForm").submit();
	}
}