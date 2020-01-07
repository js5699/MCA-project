<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	
  <title>Shop Homepage - Start Bootstrap Template</title>

	 
  <!-- Bootstrap core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<!-- Custom styles for this template -->
	<link href="/resources/css/shop-homepage.css" rel="stylesheet" type = "text/css">	

 
 	 <!-- Bootstrap core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<!-- Custom styles for this template -->
	<link href="/resources/css/shop-homepage.css" rel="stylesheet" type = "text/css">	

 	
 
</head>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<sec:authorize access="isAnonymous()">
						<li class="nav-item active"><a class="nav-link" href="/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="account/join">회원가입</a></li>						
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" id="allbk">전체도서</a></li>
					<li class="nav-item"><a class="nav-link" href="/shop/cart">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" href="../NoticeBoard/noticeList">고객센터</a></li>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item">
							<form action="/logout" method="post" role="form">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<a class="nav-link logoutbtn" href="/">로그아웃</a>
								<script src="/resources/vendor/jquery/jquery.min.js"></script>
								<script>
									$(".logoutbtn").on("click",function(e) {
										e.preventDefault();
										$("form").submit();
									});
								</script>
							</form>
						</li>	
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>

    
 <!-- 전체도서 구현 --> 	
        <%--  <div class="topMenu">         	
            <ul class="menu01">
            	<c:forEach var="i" begin="0" end="51" step="3">                   
                <li>             
  		            <ul class="dept01">
  		             <c:forEach items="${cid}" var="cid" varStatus="status" begin="${i}" end="${i}" >
                      	<span><a href="/shop/list?cid=${cid.cid}&ref=${cid.cidref}">${cid.cname}</a></span>
                      </c:forEach>	
                      <c:forEach items="${cid}" var="cid" varStatus="status" begin="${i + 1}" end="${i + 1}">
                        <li id="nop"><a href="/shop/list?cid=${cid.cid}&ref=${cid.cidref}">${cid.cname}</a></li>
                      </c:forEach>
                      <c:forEach items="${cid}" var="cid" varStatus="status" begin="${i + 2}" end="${i + 2}" >
                        <li id="nop"><a href="/shop/list?cid=${cid.cid}&ref=${cid.cidref}">${cid.cname}</a></li>
                      </c:forEach> 
                    </ul>		
                </li>
               </c:forEach>              
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
                           
            </ul>
        </div>     
    --%>
 <!-- 전체도서 구현 -->
	
         <div class="topMenu">         	
            <ul class="menu01">                   
                <li>            
  		   			<ul class="dept01">
                      	<span><a href="/shop/list?cid=11000">가정 살림</a></span>
                        <li id="nop"><a href="/shop/list?cid=11001&ref=11000">육아</a></li>
                        <li id="nop"><a href="/shop/list?cid=11002&ref=11000">요리</a></li>
                    </ul>               	
                </li>               
                <li>
                    <ul class="dept01">
                    	<span><a href="/shop/list?cid=11100">건강 취미</a></span>
                        <li id="nop"><a href="/shop/list?cid=11101&ref=11100">스포츠</a></li>
                        <li id="nop"><a href="/shop/list?cid=11102&ref=11100">퍼즐</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="dept01">
                    	<span><a href="/shop/list?cid=11200">경제 경영</a></span>
                         <li id="nop"><a href="/shop/list?cid=11201&ref=11200">경제</a></li>
                        <li id="nop"><a href="/shop/list?cid=11202&ref=11200">마케팅</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="dept01">
                    	<span><a href="/shop/list?cid=11300">사회정치</a></span>
                         <li id="nop"><a href="/shop/list?cid=11301&ref=11300">정치/외교</a></li>
                        <li id="nop"><a href="/shop/list?cid=11302&ref=11300">사회학</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=11400">소설시희곡</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=11401&ref=11400">한국소설</a></li>
                        <li id="nop"><a href="/shop/list?cid=11402&ref=11400">영미소설</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=11500">수험서자격증</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=11501&ref=11500">공무원</a></li>
                        <li id="nop"><a href="/shop/list?cid=11502&ref=11500">교원임용시험</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=11600">어린이</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=11601&ref=11600">어린이 교양</a></li>
                        <li id="nop"><a href="/shop/list?cid=11602&ref=11600">어린이 문학</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=11700">에세이</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=11701&ref=11700">한국 에세이</a></li>
                        <li id="nop"><a href="/shop/list?cid=11702&ref=11700">외국 에세이</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=11800">여행</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=11801&ref=11800">국내여행</a></li>
                        <li id="nop"><a href="/shop/list?cid=11802&ref=11800">해외여행</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=11900">역사</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=11901&ref=11900">한국사</a></li>
                        <li id="nop"><a href="/shop/list?cid=11902&ref=11900">서양사</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=12000">예술</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=12001&ref=12000">건축</a></li>
                        <li id="nop"><a href="/shop/list?cid=12002&ref=12000">음악</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=12100">유아</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=12101&ref=12100">0-3세</a></li>
                        <li id="nop"><a href="/shop/list?cid=12102&ref=12100">4-6세</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=12200">청소년</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=12201&ref=12200">인문 일반</a></li>
                        <li id="nop"><a href="/shop/list?cid=12202&ref=12200">기호학/언어학</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=12300">자기계발</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=12301&ref=12300">처세술/삶의 자세</a></li>
                        <li id="nop"><a href="/shop/list?cid=12302&ref=12300">성공학/경력관리</a></li>
                    </ul>
                </li>
                 <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=12400">자연과학</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=12401&ref=12400">과학</a></li>
                        <li id="nop"><a href="/shop/list?cid=12402&ref=12400">수학</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=12500">종교</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=12501&ref=12500">천주교</a></li>
                        <li id="nop"><a href="/shop/list?cid=12502&ref=12500">기독교(개신교)</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="dept01">
                		<span><a href="/shop/list?cid=12600">it모바일</a></span>                    
                         <li id="nop"><a href="/shop/list?cid=12601&ref=12600">컴퓨터공학</a></li>
                        <li id="nop"><a href="/shop/list?cid=12602&ref=12600">OS/데이터베이스</a></li>
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
    
		
<script  src="//code.jquery.com/jquery-latest.min.js"></script>

<script>

	 $('#allbk').click(function() {
   		$('.dept01').slideDown(300);
   		
	});	 

	$(document).ready(function(){

			$('#allbk').click(function(){

				var offset = $('body').offset();             

		        $('html').animate({scrollTop : offset.top}, 400);

			});

	});

	
$(document).on('mouseover', 'div', function () {
    if (!$(this).hasClass('topMenu')) {
        $('.dept01').slideUp(300);
    }
});
</script>	
<!-- /전체도서 구현 -->