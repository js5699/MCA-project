<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MCA Books</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="/resources/css/shop-homepage.css" rel="stylesheet" type = "text/css">

</head>

<body>

	<!-- Navigation -->
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
					<li class="nav-item active"><a class="nav-link" href="/">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="NoticeBoard/list">고객센터</a></li>
					<sec:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link" href="account/join">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item">
							<form action="/logout" method="post" role="form">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<a class="nav-link logoutbtn" href="/">로그아웃</a>
								<script src="/resources/vendor/jquery/jquery.min.js"></script>
								<script>
									$(".logoutbtn").on("click", function(e) {
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
	

	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<div class="col-lg-3">
				<%@ include file="sideMenu.jsp" %>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
