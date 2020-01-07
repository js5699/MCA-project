<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../includes/header.jsp"%>

<!-- content -->


<c:if test="${result eq 'success'}">
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<strong>회원탈퇴 완료</strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>

<c:if test="${result == 'error'}">
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<strong>비밀번호 일치하지않음</strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>

<%@ include file="../includes/footer.jsp"%>
