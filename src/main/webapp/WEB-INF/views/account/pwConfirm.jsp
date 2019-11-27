<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>
<div class="row">

	<form class="form-inline" action="pwConfirm" method="post">
		<div class="form-group  text-center">
			<label for="inputuserpw1">비밀번호</label> <input type="password" class="form-control" name="userpw" id="inputuserpw1" placeholder="Password">
		</div>
		<button type="submit" class="btn btn-primary">Primary</button>
	</form>
		
	<c:if test="${msg}">
		<p class="bg-danger">${msg}</p>
	</c:if>
	
</div>
<%@ include file="../includes/footer.jsp"%>