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
			url: '/customerservice/inquiry/admin/classification',
			data: { classification: classification, page: page }, // 페이지 번호와 카테고리 정보를 전달합니다.
			success: function(data) {
				var inquiryList = data.inquiryList;
				var pagination = data.pagination;
				var inquiryListHTML = "";
				for (var i = 0; i < inquiryList.length; i++) {
					var inquiry = inquiryList[i];
					var formattedDate = formatDate(inquiry.createdAt); // 날짜 포맷 변환
					var answer;
					if(inquiry.answer == 0) {
						answer = "답변미완료"
					} else {
						answer = "답변완료"
					}
					inquiryListHTML += '<tr>' +
						'<td><a href="/customerservice/inquiry/detail?page=' + pagination.paging.page + '&id=' + inquiry.id + '">' + inquiry.title + '</a></td>' +
						'<td><p>' + answer + '</p></td>' +
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
				$('#announcement-list-container').html(inquiryListHTML);
				$('#pagination--a').html(paginationHTML);
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
