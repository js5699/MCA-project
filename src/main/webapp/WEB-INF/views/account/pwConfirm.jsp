<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<div class="row justify-content-md-center formContainer">
	<div class="col-lg-12 ">
		<h5 class="pageSubtitle">비밀번호 확인</h5>
	</div>
	
	<div class="col-lg-12">
		<form action="/account/pwConfirm" method="post" name="pwConfirm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="row" style="margin:30px 0;">
				<div class="col-sm-4 text-right">
					<label for="staticEmail2" class="col-form-label">비밀번호</label>
				</div>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="userpwcf" id="inputuserpw1" placeholder="PASSWORD">
				</div>
				<div class="col">
					<button type="submit" class="btn btn-primary">확인</button>
				</div>
			</div>
		</form>
	</div>
	<c:if test="${result.error}">
		<p class="bg-danger">비밀번호가 틀렷읍니다</p>
	</c:if>

</div>

<%@ include file="../includes/footer.jsp"%>