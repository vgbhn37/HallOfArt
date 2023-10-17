<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hall Of Art</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/resources/css/header.css">
</head>


	<header role = "banner" class = "Header">
		<div class = "Header_top">
			<div class="Header_home">
				<h1>
					<a href="/" style="--ratio:5.230769230769231"><img alt="#" src="/resources/images/htest.jpg" style="width: 30%;"></a>
				</h1>
			</div>
			<ul class="Header_links">
				<c:if test="${empty user}">
					<li><a href="http://localhost/user/sign-in" style="--color:#000; --color-hover:#fff; margin-right: 20px;" class="login_btn"><span><i class="fa-solid fa-arrow-right-to-bracket"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Login</span></a></li>
					<li><a href="http://localhost/user/sign-up" style="--color:#008573; --color-hover:#0a4f51" class="signIn_button"><span><i class="fa-solid fa-user-plus"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Sign-up</span></a></li>
				</c:if>
				<c:if test="${user.roleTypeId == 2}">
					<li><a href="http://localhost/admin/main" style="--color:#000; --color-hover:#fff; margin-right: 20px;" class="login_btn"><span><i class="fa-solid fa-screwdriver-wrench"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Admin</span></a></li>
					<li><a href="http://localhost/user/sign-out" style="--color:#008573; --color-hover:#0a4f51" class="signIn_button"><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Logout</span></a></li>
				</c:if>
				<c:if test="${user.roleTypeId == 1}">
					<li><a href="http://localhost/user/my-info" style="--color:#000; --color-hover:#fff; margin-right: 20px;" class="login_btn"><span><i class="fa-solid fa-house-user"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Mypage</span></a></li>
					<li><a href="http://localhost/user/sign-out" style="--color:#008573; --color-hover:#0a4f51" class="signIn_button"><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Logout</span></a></li>
				</c:if>
			</ul>
		</div>
		<nav role="navigation" class="Header_Navigation">
			<div class="HorizontalList">
				<div class="HorizontalList_container">
					<ul class="HorizontalList_track">
						<li class="HorizontalList_item dropdown"><a class="Header_Nav_link" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="Header_Nav_text"  id="item_customer">회원</span></a>
							<ul class="dropdown-menu">
							    <li class="dropdown-item"><a href="http://localhost/customerservice/announcement">공지사항</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/information">오시는길</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/inquiry">1:1문의하기</a></li>
						  </ul>
						</li>
						<li class="HorizontalList_item dropdown"><a class="Header_Nav_link" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="Header_Nav_text"  id="item_customer">공연/예매</span></a>
							<ul class="dropdown-menu">
							    <li class="dropdown-item"><a href="http://localhost/customerservice/announcement">공지사항</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/information">오시는길</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/inquiry">1:1문의하기</a></li>
						  </ul>
						</li>
						<li class="HorizontalList_item dropdown"><a class="Header_Nav_link" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="Header_Nav_text"  id="item_customer">대관</span></a>
							<ul class="dropdown-menu">
							    <li class="dropdown-item"><a href="http://localhost/customerservice/announcement">공지사항</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/information">오시는길</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/inquiry">1:1문의하기</a></li>
						  </ul>
						</li>
						<li class="HorizontalList_item dropdown"><a class="Header_Nav_link" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="Header_Nav_text"  id="item_customer">고객센터</span></a>
							<ul class="dropdown-menu">
							    <li class="dropdown-item"><a href="http://localhost/customerservice/announcement">공지사항</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/information">오시는길</a></li>
							    <li class="dropdown-item"><a href="http://localhost/customerservice/inquiry">1:1문의하기</a></li>
						  </ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
<script>
	var didScroll;
	var lastScrollTop = 0;
	var delta = 5;
	var navbarHeight = $('header').outerHeight();

	$(window).scroll(function(event){
	    didScroll = true;
	});

	setInterval(function() {
	    if (didScroll) {
	        hasScrolled();
	        didScroll = false;
	    }
	}, 250);

	function hasScrolled() {
	    var st = $(this).scrollTop();
	    
	    // Make sure they scroll more than delta
	    if(Math.abs(lastScrollTop - st) <= delta)
	        return;
	    
	    // If they scrolled down and are past the navbar, add class .nav-up.
	    // This is necessary so you never see what is "behind" the navbar.
	    if (st > lastScrollTop && st > navbarHeight){
	        // Scroll Down
	        $('header').removeClass('nav-down').addClass('nav-up');
	    } else {
	        // Scroll Up
	        if(st + $(window).height() < $(document).height()) {
	            $('header').removeClass('nav-up').addClass('nav-down');
	        }
	    }
	    
	    lastScrollTop = st;
	}
</script>
<body>
<section style="min-height: calc(100vh - 204px);">