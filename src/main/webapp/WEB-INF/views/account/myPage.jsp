<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

	
<div class="col-md-9 formContainer">
	<c:if test="${result eq 'pwModSuccess'}">
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			<strong>비밀번호 변경 완료</strong> 비밀번호가 변경 되었습니다. 로그인시 새로운 비밀번호를 입력하세요.
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>

	<h5>내 정보</h5>

	<table class="table">
		<tr>
			<th style="width: 16.66%">아이디</th>
			<td>${user.userid}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${user.name}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${user.phone}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${user.email}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>(우)${user.zipcode} <br /> ${user.address1} <br />
				${user.address2}
			</td>
		</tr>

	</table>
	
	<div class="col-md-12 text-right">
		<button type="button" class="btn btn-primary" onclick="location.href='pwConfirm'">수정</button>
	</div>

	
	<div class="col-md-12 formContainer">
		<h5>회원 탈퇴</h5>
	</div>
		

	<button type="button" class="btn btn-outline-light">수정</button>

</div>

<%@ include file="../includes/footer.jsp"%>