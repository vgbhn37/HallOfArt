<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 30px;
}

p {
	margin: 0;
}

td:nth-child(1) {
	width:20%;
}

td:last-child{
	text-align: right;
	width:30%;
}

td {
	vertical-align: middle;
}

td a {
    color: black;
    text-decoration: none !important;
    margin-left: 15px;
}


.classification {
	border: 1px solid #ed1a3b;
    color: #ed1a3b;
    display: inline-block;
    padding: 8px 10px;
}

.container {
	margin-top: 50px;
}

.write-btn {
	text-align: right;
}

.title--announcement {
    position: relative;
    color: #535353;
    font-size: 35px;
    line-height: 35px;
    padding: 5px 0 20px 22px;
    margin-bottom: 35px;
    border-bottom: 1px solid #535353;
}

.title--announcement:before {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 12px;
    height: 12px;
    background: #ed1a3b;
    content: "";
}

.tab--announcement {
    padding: 0 0 1px 1px;
    margin-bottom: 30px;
    overflow: hidden;
}

.tab--announcement li{
	float: left;
    display: table;
    width: calc(20% - 2px);;
    height: 66px;
    position: relative;
    box-sizing: border-box;
    margin-right: 0px;
}

.tab--announcement li:last-child {
    border-right: none; /* 마지막 li 요소의 마진을 없애서 간격 설정 */
}

.tab--announcement li a {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    font-size: 16px;
    color: #8b8b8b;
    line-height: 20px;
    padding: 5px 8px;
}

.tab--announcement > li.on::before {
    z-index: 10;
    border: 1px solid #222;
}

.tab--announcement > li::before {
    position: absolute;
    top: 0;
    left: -1px;
    width: calc(100% - 1px);
    height: calc(100% - 1px);
    border: 1px solid #e5e5e5;
    content: "";
}

.tab--announcement::after {
    content: "";
    display: table;
    clear: both;
}

*, ::after, ::before {
    box-sizing: content-box;
}

.tab--announcement li.active {
  border: 2px solid #222; 
  border-top: 1px solid #222;
}

.tab--announcement li.active a {
  font-weight: bold;
  color: black;
}

.paging {
    text-align: center;
    margin-top: 40px;
    margin-bottom : 40px;
}

.pagination {
    display: inline-block;
}

.pagination li {
    display: inline-block;
    list-style: none;
}

.pagination li a {
    display: inline-block;
    padding: 5px 10px;
    border: 1px solid #ddd;
    background-color: #fff;
    color: #151432;
    border-radius: 5px; 
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.pagination li a:hover {
    background-color: #151432; 
    color: #fff; 
}

.pagination li.active a{
	background-color: #151432; 
    color: #fff;
}

.write-btn {
    display: inline-block;
    padding: 10px 20px;
	border: 1px solid black;
    background-color: #fff;
    color: #151432;
    margin-bottom: 50px;
    text-decoration: none !important;
    transition: background-color 0.3s, color 0.3s;
}

.write-btn:hover {
    background-color: #151432;
    color: #fff;
}

</style>
<div class="container">
	<h1 class = "title--announcement">공지사항</h1>
	
	<ul class = tab--announcement>
	    <li class="active" data-classification="전체"><a href="#">전체</a></li>
	    <li data-classification="대관"><a href="#">대관</a></li>
	    <li data-classification="전시"><a href="#">전시</a></li>
	    <li data-classification="예매"><a href="#">예매</a></li>
	    <li data-classification="회원"><a href="#">회원</a></li>
	</ul>
	
	<table class="table">
		<tbody id="announcement-list-container">
		</tbody>
	</table>
	<div class="paging">
		<form action="<c:url value='/customerservice/announcement'/>"
			name="pageForm">
			<div class="text-center clearfix">
				<ul class="pagination" id="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item "><a class="page-list" href="#"
							data-page="${pagination.beginPage-1}">Prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pagination.beginPage}"
						end="${pagination.endPage}">
						<li
							class="${pagination.paging.page == num ? 'age-item active' : ''} page-item"
							><a class="page-list" href="#" data-page="${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-list" href="#"
							data-page="${pagination.endPage+1}">Next</a></li>
					</c:if>
				</ul>

				<!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
				<input type="hidden" name="page" value="${pagination.paging.page}">
				<input type="hidden" name="recordSize"
					value="${pagination.paging.recordSize}">

			</div>
		</form>
	</div>
	<c:if test="${user.roleTypeId == 2}">
	<a href="/customerservice/announcement/write" class="write-btn">글쓰기</a>
</c:if>
</div>
<script>
    $(document).ready(function() {
        // 페이지 로드 시 초기 페이지 로드와 페이지네이션 버튼 클릭 이벤트 핸들러를 등록합니다.
        setupPaginationEventHandlers();

        // 초기 페이지 로드 시, "전체" 카테고리를 보여줍니다.
        loadAnnouncements("전체");

        $('.tab--announcement li').click(function() {
            // 클릭한 li 요소의 데이터 속성을 읽어옵니다.
            var classification = $(this).data('classification');

            // 모든 li 요소에서 active 클래스 제거
            $('.tab--announcement li').removeClass('active');
            // 클릭한 li 요소에 active 클래스 추가
            $(this).addClass('active');

            // 해당 카테고리의 공지사항을 로드합니다.
            loadAnnouncements(classification);
        });

        function setupPaginationEventHandlers() {
            // 페이지네이션 버튼 클릭 이벤트 핸들러를 document에서 직접 처리
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
    
    function formatDate(timestamp) {
    	const date = new Date(timestamp);
        return date.toLocaleDateString();
    }
</script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>