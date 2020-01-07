<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includes/header.jsp"%>

<div class="row justify-content-md-center formContainer">
	<div class="col-lg-12 ">
		<h5 class="pageSubtitle">로그인</h5>
	</div>

	<c:if test="${wd eq 'success'}">
		<div class="col-lg-7">
			<div class="alert alert-danger" role="alert">
				회원탈퇴가 완료되었습니다.
			</div>			
		</div>
	</c:if>	
	<c:if test="${result eq 'success'}">
		<div class="col-lg-7">
			<div class="alert alert-danger" role="alert">
				회원탈퇴가 완료되었습니다. result-success
			</div>			
		</div>
	</c:if>	
	
	<c:if test="${error}">
		<div class="col-lg-7">
			<div class="alert alert-danger" role="alert">
				아이디와 비밀번호를 확인하세요.
			</div>			
		</div>
	</c:if>	
	
	<div class="col-lg-7 formContainer">
		<form role="form" method="post" action="/login">
			<fieldset>
				<div class="form-group">
					<input class="form-control" placeholder="ID" name="username"
						type="text" autofocus>
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="PASSWORD" name="password"
						type="password" value="">
				</div>
				<div class="checkbox">
					<label> <input name="remember" type="checkbox"
						value="Remember Me">Remember Me
					</label>
				</div>
				<!-- Change this to a button or input when using this as a form -->
				<a href="/index.html" class="btn btn-primary btn-lg btn-block">Login</a>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>

<script>
	$(".btn-primary").on("click", function(e) {

		e.preventDefault();
		$("form").submit();

	});
</script>

<%@ include file="includes/footer.jsp"%>