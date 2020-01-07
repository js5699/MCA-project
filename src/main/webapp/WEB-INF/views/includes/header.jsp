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
 	
         <div class="topMenu">         	
            <ul class="menu01">
            	<c:forEach var="i" begin="0" end="51" step="3">                   
                <li>             
  		             <ul class="dept01">
  		             <c:forEach items="${cid}" var="cid" varStatus="status" begin="${i}" end="${i}" >
                      	<span><a href="/shop/list?cid=${cid.cid} !!! ${cid.cidref}">${cid.cname}</a></span>
                      </c:forEach>	
                      <c:forEach items="${cid}" var="cid" varStatus="status" begin="${i + 1}" end="${i + 1}">
                        <li id="nop"><a href="/shop/list?cid=${cid.cid} !!! ${cid.cidref}&ref=">${cid.cname}</a></li>
                      </c:forEach>
                      <c:forEach items="${cid}" var="cid" varStatus="status" begin="${i + 2}" end="${i + 2}" >
                        <li id="nop"><a href="/shop/list?cid=${cid.cid}  ${cid.cidref}&ref=">${cid.cname}</a></li>
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