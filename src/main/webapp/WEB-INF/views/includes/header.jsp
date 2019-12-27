<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MCA Books</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/d6082c366a.js" crossorigin="anonymous"></script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="/resources/css/shop-homepage.css" rel="stylesheet" type = "text/css">

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="/">Home<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="/NoticeBoard/noticeList">고객센터</a></li>
					<sec:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link" href="/account/join">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<a class="nav-link" href="/account/myPage">마이페이지</a>
						<form action="/logout" method="post" role="form" id="logoutForm"> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<a class="nav-link logoutbtn" href="/">로그아웃</a>
						</form>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
	 <!-- 전체도서 구현 -->
<!-- <div class="logo">
        </div>
        <div class="topMenu">
            <ul class="menu01">
                <li>
                    <ul class="dept01">
                      	<span><a href="/shop/list?c=11000&l=1">가정 살림</a></span>
                        <li id="nop"><a href="/shop/list?c=11001&l=2">육아</a></li>
                        <li id="nop"><a href="/shop/list?c=11002&l=2">요리</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="dept01">
                    	<span><a href="/shop/list?c=11100&l=1">건강 취미</a></span>
                        <li id="nop"><a href="/shop/list?c=11101&l=2">스포츠</a></li>
                        <li id="nop"><a href="/shop/list?c=11102&l=2">퍼즐</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="dept01">
                    	<span><a href="/shop/list?c=11200&l=1">경제 경영</a></span>
                         <li id="nop"><a href="/shop/list?c=11201&l=2">경제</a></li>
                        <li id="nop"><a href="/shop/list?c=11202&l=2">마케팅</a></li>                    </ul>
                </li>
                <li>
                    <ul class="dept01">
                    	<span><a href="/shop/list?c=11300&l=1">사회정치</a></span>
                         <li id="nop"><a href="/shop/list?c=11301&l=2">정치/외교</a></li>
                        <li id="nop"><a href="/shop/list?c=11302&l=2">사회학</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=11400&l=1">소설시희곡</a></span>                    
                         <li id="nop"><a href="/shop/list?c=11401&l=2">한국소설</a></li>
                        <li id="nop"><a href="/shop/list?c=11402&l=2">영미소설</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=11500&l=1">수험서자격증</a></span>                    
                         <li id="nop"><a href="/shop/list?c=11501&l=2">공무원</a></li>
                        <li id="nop"><a href="/shop/list?c=11502&l=2">교원임용시험</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=11600&l=1">어린이</a></span>                    
                         <li id="nop"><a href="/shop/list?c=11601&l=2">어린이 교양</a></li>
                        <li id="nop"><a href="/shop/list?c=11602&l=2">어린이 문학</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=11700&l=1">에세이</a></span>                    
                         <li id="nop"><a href="/shop/list?c=11701&l=2">한국 에세이</a></li>
                        <li id="nop"><a href="/shop/list?c=11702&l=2">외국 에세이</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=11800&l=1">여행</a></span>                    
                         <li id="nop"><a href="/shop/list?c=11801&l=2">국내여행</a></li>
                        <li id="nop"><a href="/shop/list?c=11802&l=2">해외여행</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=11900&l=1">역사</a></span>                    
                         <li id="nop"><a href="/shop/list?c=11901&l=2">한국사</a></li>
                        <li id="nop"><a href="/shop/list?c=11902&l=2">서양사</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=12000&l=1">예술</a></span>                    
                         <li id="nop"><a href="/shop/list?c=12001&l=2">건축</a></li>
                        <li id="nop"><a href="/shop/list?c=12002&l=2">음악</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=12100&l=1">유아</a></span>                    
                         <li id="nop"><a href="/shop/list?c=12101&l=2">0-3세</a></li>
                        <li id="nop"><a href="/shop/list?c=12102&l=2">4-6세</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=12200&l=1">청소년</a></span>                    
                         <li id="nop"><a href="/shop/list?c=12201&l=2">인문 일반</a></li>
                        <li id="nop"><a href="/shop/list?c=12202&l=2">기호학/언어학</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=12300&l=1">자기계발</a></span>                    
                         <li id="nop"><a href="/shop/list?c=12301&l=2">처세술/삶의 자세</a></li>
                        <li id="nop"><a href="/shop/list?c=12302&l=2">성공학/경력관리</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=12400&l=1">자연과학</a></span>                    
                         <li id="nop"><a href="/shop/list?c=12401&l=2">과학</a></li>
                        <li id="nop"><a href="/shop/list?c=12402&l=2">수학</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=12500&l=1">종교</a></span>                    
                         <li id="nop"><a href="/shop/list?c=12501&l=2">천주교</a></li>
                        <li id="nop"><a href="/shop/list?c=12502&l=2">기독교(개신교)</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?c=12600&l=1">it모바일</a></span>                    
                         <li id="nop"><a href="/shop/list?c=12601&l=2">컴퓨터공학</a></li>
                        <li id="nop"><a href="/shop/list?c=12602&l=2">OS/데이터베이스</a></li>
                    </ul>
                </li>
               <li>
                	<ul class="dept01">
                		<br><br><br>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<br><br><br><p></p>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<br><br><br><p></p>
                    </ul>
                </li>
            </ul>
        </div>
 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
	$('#allbk').click(function() {
    $('.dept01').slideDown(300).focus();
	});
	
	
$(document).on('mouseover', 'div', function () {
    if (!$(this).hasClass('topMenu')) {
        $('.dept01').slideUp(300);
    }
});
</script>	
<!-- /전체도서 구현 -->

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<%@ include file="sideMenu.jsp" %>
			</div>

			<div class="col-lg-9">
