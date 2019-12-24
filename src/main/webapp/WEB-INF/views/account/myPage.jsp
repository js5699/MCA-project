<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-md-12">
		<h4>내 회원 정보</h4>
		
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>${user.userid}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td></td>
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
				<td>
				${user.zipcode} <br />
				${user.address1} <br />
				${user.address2}
				</td>
			</tr>		
		
		</table>
		
		<button type="button" class="btn btn-outline-light" onclick="location.href='pwConfirm?userid=testid'">수정</button>
		
	</div>

</div>
<div class="row">
	<div class="col-md-12">
		<h4>회원 탈퇴</h4>
		
		<button type="button" class="btn btn-outline-light">수정</button>
		
	</div>

</div>


<%@ include file="../includes/footer.jsp"%>